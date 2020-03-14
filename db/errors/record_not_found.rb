# frozen_string_literal: true

module DB
  module Errors
    class RecordNotFound < StandardError
      attr_reader :connection

      def initialize(msg = 'Record not found with parameters used')
        super
      end
    end
  end
end
