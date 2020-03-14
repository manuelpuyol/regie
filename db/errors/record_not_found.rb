# frozen_string_literal: true

require_relative 'base'

module DB
  module Errors
    class RecordNotFound < Base
      def initialize(msg = 'Record not found with parameters used')
        super
      end
    end
  end
end
