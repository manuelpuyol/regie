# frozen_string_literal: true

require_relative 'base'

module DB
  module MySQL
    module Queries
      class Where < Base
        def call
          query = "#{builder.generate_query(includes: @includes)} WHERE #{builder.where_statement(@args)} #{builder.limit_statement(@limit)}"
          sql_result = connection.execute(query)

          caster.cast_sql_results(sql_result.to_a, @includes)
        end
      end
    end
  end
end
