# frozen_string_literal: true

require_relative 'base'

module DB
  module MySQL
    module Queries
      class First < Base
        def call
          query = "#{builder.generate_query(includes: @includes)} #{builder.first_statement}"
          sql_result = connection.query(query)

          caster.cast_sql_results(sql_result.to_a, @includes).first
        end
      end
    end
  end
end
