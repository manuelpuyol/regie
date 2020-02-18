# frozen_string_literal: true

module Registration
  module Presenters
    class CoursePresenter
      def initialize(course)
        @course = course
      end

      def call
        "#{@course.code} - #{@course.name}"
      end
    end
  end
end
