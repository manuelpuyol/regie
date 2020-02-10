# frozen_string_literal: true

module DB
  module MySQL
    module Queries
      module Base
        def self.included(base)
          base.class_eval do
            extend ClassMethods
            extend QueryBuilder
            extend ModelCaster
            extend RelationsCacher
          end
        end

        def reload(includes: nil)
          self.class.find(id, includes: includes)
        end

        def update(attrs)
          assign_attributes(attrs)
          return false unless valid?

          self.class.update(id, attrs)
          true
        end

        def destroy
          ActiveRecord::Base.transaction do
            destroy_dependents
            self.class.destroy(id)
          end
          true
        rescue StandardError
          false
        end

        module ClassMethods
          def all(includes: nil, limit: nil)
            query = generate_query(includes: includes, limit: limit)
            sql_result = connection.execute(query)

            cast_sql_results(sql_result.to_a, includes)
          end

          def find(id, includes: nil)
            query = "#{generate_query(includes: includes)} #{find_statement(id)}"
            sql_result = connection.execute(query)

            cast_sql_results(sql_result.to_a, includes).first
          end

          def first(includes: nil)
            query = "#{generate_query(includes: includes)} #{first_statement}"
            sql_result = connection.execute(query)

            cast_sql_results(sql_result.to_a, includes).first
          end

          def where(args, includes: nil, limit: nil)
            query = "#{generate_query(includes: includes)} WHERE #{where_statement(args)} #{limit_statement(limit)}"
            sql_result = connection.execute(query)

            cast_sql_results(sql_result.to_a, includes)
          end

          def update(id, attrs)
            query = generate_update_query(id, attrs)

            connection.execute(query)
          end

          def create(attrs, includes: nil)
            model = new(attrs)
            return model unless model.valid?

            query = generate_create_query(attrs.with_indifferent_access)

            sql_result = connection.execute(query)

            id = sql_result.to_a.first['id']
            find(id, includes: includes)
          end

          def destroy(id)
            query = generate_destroy_query(id)

            connection.execute(query)
          end
        end

        private

        def destroy_dependents
          dependent_relations.each do |name, _relation|
            instances = send(name)
            instances&.each(&:destroy)
          end
        end

        def dependent_relations
          relations.select do |_name, relation|
            relation[:dependent] == :destroy
          end
        end
      end
    end
  end
end
