# frozen_string_literal: true

require_relative 'current_student_singleton'
require_relative 'course'

module Registration
  class CurrentCoursesFetcher
    def initialize
      @student = CurrentStudentSingleton.instance.get
    end

    # TODO: Actually query courses
    def call
      [
        Course.new(name: 'MPCS 51044 C/C++ for Advanced Programmers'),
        Course.new(name: 'MPCS 53110 Foundations of Data Analysis'),
        Course.new(name: 'MPCS 51410 Object Oriented Programming')
      ]
    end
  end
end
