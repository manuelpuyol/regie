# frozen_string_literal: true

module DB
  module MySQL
    module Relations
      RELATION_TYPES = {
        belongs_to: 'BelongsTo',
        has_many: 'HasMany'
      }.freeze

      def self.included(base)
        base.class_eval do
          extend ClassMethods

          self.relations = {}
        end
      end

      module ClassMethods
        def relations
          @@relations
        end

        def relations=(val)
          @@relations = val # rubocop:disable Style/ClassVars
        end

        def belongs_to(name, klass:, polymorphic: false, foreign_key: nil)
          add_relation(name, type: :belongs_to, klass: klass, polymorphic: polymorphic, foreign_key: foreign_key)

          define_method(name) do
            relation = self.class.relations[name]

            return instance_variable_get(relation[:variable_name]) if instance_variable_get(relation[:variable_name])

            instance_variable_set(relation[:variable_name], relation[:klass].find(send(relation[:column_name])))
          end
        end

        # rubocop:disable Naming/PredicateName
        def has_many(name, klass:, foreign_key: "#{table_name.singularize}_id", dependent: nil)
          add_relation(name, type: :has_many, klass: klass, foreign_key: foreign_key, dependent: dependent)

          define_method(name) do
            relation = self.class.relations[name]

            return instance_variable_get(relation[:variable_name]) if instance_variable_get(relation[:variable_name])

            instance_variable_set(relation[:variable_name], relation[:klass].where(relation[:column_name] => id))
          end

          define_method("#{name}_count") do
            relation = self.class.relations[name]
            count_variable = "#{relation[:variable_name]}_count"

            return instance_variable_get(count_variable) if instance_variable_get(count_variable)

            send(name).size
          end
        end
        # rubocop:enable Naming/PredicateName

        private

        def add_relation(name, type:, klass:, foreign_key: nil, polymorphic: false, dependent: nil)
          relations[name] = {
            type: RELATION_TYPES[type],
            klass: klass,
            table_name: klass&.table_name,
            table_alias: name.to_s.pluralize,
            column_name: foreign_key || "#{name}_id",
            variable_name: "@#{name}",
            polymorphic: polymorphic,
            dependent: dependent
          }
        end
      end
    end
  end
end
