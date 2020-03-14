# frozen_string_literal: true

require_relative 'current_student_singleton'

module Registration
  class PrerequisitesChecker
    def initialize(course:)
      @course = course
      @student = CurrentStudentSingleton.instance.get
    end

    def call
      return true if prerequisite_ids.empty?

      (prerequisite_ids & completed_ids).size == prerequisite_ids.size
    end

    private

    def prerequisite_ids
      @course.prerequisites.map(&:id)
    end

    def completed_ids
      @student.completed_courses.map(&:id)
    end
  end
end
