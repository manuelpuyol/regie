# frozen_string_literal: true

require_relative 'builder'
require_relative 'model_caster'
require_relative '../connection_singleton'

module DB
  module MySQL
    module Queries
      class Base
        def initialize(record_class:, includes: nil, id: nil, limit: nil, attrs: nil, args: nil)
          @record_class = record_class
          @includes = includes
          @id = id
          @limit = limit
          @attrs = attrs
          @args = args
        end

        private

        def connection
          DB::MySQL::ConnectionSingleton.instance.get
        end

        def builder
          @builder ||= Builder.new(record_class: @record_class)
        end

        def caster
          @caster ||= ModelCaster.new(record_class: @record_class)
        end
      end
    end
  end
end
