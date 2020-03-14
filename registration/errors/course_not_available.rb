# frozen_string_literal: true

require_relative 'base'

module Registration
  module Errors
    class CourseNotAvailable < Base
      def initialize(msg = 'Course is not available')
        super
      end
    end
  end
end
