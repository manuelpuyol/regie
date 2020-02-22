# frozen_string_literal: true

require_relative 'base'
require_relative 'find'

module DB
  module MySQL
    module Queries
      class Create < Base
        def call
          query = builder.generate_create_query(@attrs)

          connection.query(query)
          sql_result = connection.query('SELECT LAST_INSERT_ID()')

          id = sql_result.to_a.first['LAST_INSERT_ID()']
          Find.new(id: id, record_class: @record_class, includes: @includes).call
        end
      end
    end
  end
end
