# frozen_string_literal: true

require_relative 'base'

module DB
  module MySQL
    module Queries
      class Create < Base
        def call
          query = builder.generate_create_query(@attrs)

          sql_result = connection.execute(query)

          id = sql_result.to_a.first['id']
          Find.new(id, includes: @includes).call
        end
      end
    end
  end
end
