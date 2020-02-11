# frozen_string_literal: true

require_relative 'builder'
require_relative 'model_caster'
require_relative '../connection_singleton'

module DB
  module MySQL
    module Queries
      class Base
        def initialize(table_name:, column_names:, includes: nil, id: nil, limit: nil, attrs: nil, args: nil)
          @table_name = table_name
          @column_names = column_names
          @includes = includes
          @id = id
          @limit = limit
          @attrs = attrs
          @args = args
        end

        private

        def connection
          DB::MySQL::ConnectionSingleton.get
        end

        def builder
          @builder ||= Builder.new(table_name: @table_name, column_names: @column_names)
        end

        def caster
          @caster ||= ModelCaster.new
        end
      end
    end
  end
end
