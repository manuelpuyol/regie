# frozen_string_literal: true

require_relative 'relations_cacher'

module DB
  module MySQL
    module Queries
      class ModelCaster
        def cast_sql_results(results, includes)
          models = primary_model_results(results).map do |result|
            cast_to_model(self, table_name, result)
          end

          models.each do |model|
            cacher.cache_relations(model, includes, results)
          end

          models
        end

        private

        def primary_model_results(results)
          results.uniq { |result| result["#{table_name}_id"] }
        end

        def cast_to_model(klass, table_name, result)
          params = model_params(klass, table_name, result)
          return if params['id'].nil?

          klass.new(params)
        end

        def model_params(klass, table_name, result)
          klass.column_names.each_with_object({}) do |col, obj|
            obj[col] = result["#{table_name}_#{col}"]
          end
        end

        def cacher
          @cacher ||= RelationsCacher.new
        end
      end
    end
  end
end
