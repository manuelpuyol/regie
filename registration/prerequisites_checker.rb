# frozen_string_literal: true

require_relative 'current_student'

module Registration
  class PrerequisitesChecker
    def initialize(course:)
      @course = course
      @student = CurrentStudent.instance.get
    end

    # TODO: Actually check prerequisites
    def call
      true
    end
  end
end
