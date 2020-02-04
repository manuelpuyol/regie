# frozen_string_literal: true

require './authentication/current_user_singleton'
require_relative 'current_courses_fetcher'
require_relative 'prerequisites_checker'
require_relative 'laboratories_enroller'

module Registration
  class CourseEnroller
    MAX_COURSES_PER_QUARTER = 3

    def initialize(course:)
      @course = course
      @student = Authentication::CurrentUserSingleton.instance.get
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
      CurrentCoursesFetcher.new.call.size < MAX_COURSES_PER_QUARTER
    end

    def prerequisites_met?
      PrerequisitesChecker.new(course: @course).call
    end
  end
end
