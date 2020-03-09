# frozen_string_literal: true

require_relative '../current_student_singleton'

module Registration
  module Fetchers
    class CurrentCourses
      def initialize
        @student = CurrentStudentSingleton.instance.get
      end

      def call
        @student.current_courses
      end
    end
  end
end
