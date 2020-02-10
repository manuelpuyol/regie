# frozen_string_literal: true

module DB
  module MySQL
    module Queries
      module RelationsCacher
        def cache_relations(model, includes, results)
          return if includes.nil?

          includes = [includes] unless includes.is_a?(Array)

          includes.each do |include|
            relation = model.relations[include]

            cached_relations = model_relation_results(model.id, relation, results).map do |result|
              cast_to_model(relation[:klass], relation[:table_alias], result)
            end.compact

            cache_relation_by_type(model, relation, cached_relations)
          end
        end

        private

        def cache_relation_by_type(model, relation, cached_relations)
          case relation[:type]
          when CounterRecord::Relations::RELATION_TYPES[:has_many]
            model.instance_variable_set(relation[:variable_name], cached_relations)
          when CounterRecord::Relations::RELATION_TYPES[:belongs_to]
            model.instance_variable_set(relation[:variable_name], cached_relations.first)
          else
            raise ArgumentError, "Unexpected relation type #{relation.dig(:type)}"
          end
        end

        def model_relation_results(id, relation, results)
          table_alias = relation[:table_alias]

          results.select { |result| result["#{table_name}_id"] == id }
                 .uniq { |result| result["#{table_alias}_id"] }
        end
      end
    end
  end
end
