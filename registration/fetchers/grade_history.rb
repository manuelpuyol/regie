# frozen_string_literal: true

require_relative '../current_student_singleton'

module Registration
  module Fetchers
    class GradeHistory
      def initialize
        @student = CurrentStudentSingleton.instance.get
      end

      def call
        @student.student_courses.reject { |sc| sc.grade.nil? }
      end
    end
  end
end
