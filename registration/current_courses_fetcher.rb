# frozen_string_literal: true

require_relative 'current_student_singleton'
require_relative 'course'

module Registration
  class CurrentCoursesFetcher
    def initialize
      @student = CurrentStudentSingleton.instance.get
    end

    def call
      binding.pry
      @student.courses
    end
  end
end
