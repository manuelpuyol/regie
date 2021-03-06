# frozen_string_literal: true

require_relative 'base'

module DB
  module MySQL
    module Queries
      class All < Base
        def call
          query = builder.generate_query(includes: @includes, limit: @limit)
          sql_result = connection.query(query)

          caster.cast_sql_results(sql_result.to_a, @includes)
        end
      end
    end
  end
end
