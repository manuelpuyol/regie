# frozen_string_literal: true

require_relative 'current_student_singleton'

module Registration
  class PrerequisitesChecker
    def initialize(course:)
      @course = course
      @student = CurrentStudentSingleton.instance.get
    end

    # TODO: Actually check prerequisites
    def call
      true
    end
  end
end
