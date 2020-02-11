# frozen_string_literal: true

module DB
  module MySQL
    module Queries
      class Find < Base
        def call
          query = "#{builder.generate_query(includes: @includes)} #{builder.find_statement(@id)}"
          sql_result = connection.execute(query)

          caster.cast_sql_results(sql_result.to_a, @includes).first
        end
      end
    end
  end
end
