# frozen_string_literal: true

module DB
  module MySQL
    module Queries
      class All < Base
        def all
          query = builder.generate_query(includes: @includes, limit: @limit)
          sql_result = connection.execute(query)

          caster.cast_sql_results(sql_result.to_a, @includes)
        end
      end
    end
  end
end
