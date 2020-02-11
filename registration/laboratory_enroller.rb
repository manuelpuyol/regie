# frozen_string_literal: true

require_relative 'current_student_singleton'

module Registration
  class LaboratoryEnroller
    def initialize(laboratory:)
      @laboratory = laboratory
      @student = CurrentStudentSingleton.instance.get
    end

    # TODO: Actually enroll a student in a laboratory
    def call
      true
    end
  end
end
