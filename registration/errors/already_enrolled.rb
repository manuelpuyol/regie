# frozen_string_literal: true

require_relative 'base'

module Registration
  module Errors
    class AlreadyEnrolled < Base
      def initialize(msg = 'Already enrolled in course')
        super
      end
    end
  end
end
