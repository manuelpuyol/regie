# frozen_string_literal: true

require_relative 'base'
require_relative 'find'

module DB
  module MySQL
    module Queries
      class Create < Base
        def call
          query = builder.generate_create_query(@attrs)

          sql_result = connection.query(query)

          id = sql_result.to_a.first['id']
          Find.new(id, includes: @includes).call
        end
      end
    end
  end
end
