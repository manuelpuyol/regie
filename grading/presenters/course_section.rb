# frozen_string_literal: true

require './registration/presenters/course'
require_relative 'students'

module Grading
  module Presenters
    class CourseSection
      def initialize(course_section)
        @course_section = course_section
      end

      def call
        "#{course}\n\n#{students}"
      end

      private

      def course
        Registration::Presenters::Course.new(@course_section.course).call
      end

      def students
        Students.new(@course_section.students).call.join("\n")
      end
    end
  end
end
