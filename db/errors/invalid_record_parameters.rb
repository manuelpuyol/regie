# frozen_string_literal: true

require_relative 'base'

module DB
  module Errors
    class InvalidRecordParameters < Base
      def initialize(msg = 'Record has invalid parameters')
        super
      end
    end
  end
end
