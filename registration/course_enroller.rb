# frozen_string_literal: true

require_relative 'fetchers/current_courses'
require_relative 'current_student_singleton'
require_relative 'prerequisites_checker'
require_relative 'laboratories_enroller'

module Registration
  class CourseEnroller
    MAX_COURSES_PER_QUARTER = 3

    def initialize(course:)
      @course = course
      @student = CurrentStudentSingleton.instance.get
    end

    # TODO: Actually enroll a student in a course
    def call
      return false unless can_enroll? && enroll_laboratories

      true
    end

    private

    def enroll_laboratories
      LaboratoriesEnroller.new(course: @course).call
    end

    def can_enroll?
      enough_space? && prerequisites_met?
    end

    def enough_space?
      Fetchers::CurrentCourses.new.call.size < MAX_COURSES_PER_QUARTER
    end

    def prerequisites_met?
      PrerequisitesChecker.new(course: @course).call
    end
  end
end
