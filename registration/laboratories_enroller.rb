# frozen_string_literal: true

require_relative 'fetchers/course_laboratories'
require_relative 'current_student_singleton'
require_relative 'laboratory_enroller'

module Registration
  class LaboratoriesEnroller
    def initialize(course:)
      @course = course
      @student = CurrentStudentSingleton.instance.get
    end

    # TODO: Actually enroll a student in a laboratory
    def call
      enrollments.all?
    end

    private

    def enrollments
      laboratories.map do |lab|
        LaboratoryEnroller.new(laboratory: lab).call
      end
    end

    def laboratories
      Fetchers::CourseLaboratories.new(course: @course).call
    end
  end
end
