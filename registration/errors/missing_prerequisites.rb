# frozen_string_literal: true

require_relative 'base'

module Registration
  module Errors
    class MissingPrerequisites < Base
      def initialize(msg = 'Some prerequisites are missing')
        super
      end
    end
  end
end
