# frozen_string_literal: true

module DB
  module Errors
    class InvalidRecordParameters < StandardError
      def initialize(msg = 'Record has invalid parameters')
        super
      end
    end
  end
end
