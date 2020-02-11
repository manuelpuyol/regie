# frozen_string_literal: true

require_relative 'current_student'

module Registration
  class LaboratoryEnroller
    def initialize(laboratory:)
      @laboratory = laboratory
      @student = CurrentStudent.instance.get
    end

    # TODO: Actually enroll a student in a laboratory
    def call
      true
    end
  end
end
