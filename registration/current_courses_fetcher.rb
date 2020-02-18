# frozen_string_literal: true

require_relative 'current_student_singleton'
require_relative 'course'

module Registration
  class CurrentCoursesFetcher
    def initialize
      @student = CurrentStudentSingleton.instance.get
    end

    def call
      @student.courses
    end
  end
end
