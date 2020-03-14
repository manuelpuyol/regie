# frozen_string_literal: true

require_relative 'fetchers/current_courses'
require_relative 'current_student_singleton'
require_relative 'prerequisites_checker'
require_relative 'laboratories_enroller'
require_relative 'course_section'
require_relative 'student_section'
require_relative 'errors/exceeded_registration_max'
require_relative 'errors/already_enrolled'
require_relative 'errors/missing_prerequisites'

module Registration
  class CourseEnroller
    MAX_COURSES_PER_QUARTER = 3

    def initialize(course_section_id:)
      @course_section_id = course_section_id
      @student = CurrentStudentSingleton.instance.get
    end

    def call
      enroll if can_enroll?
    end

    private

    def enroll
      StudentSection.new(student_id: @student.id, section_id: @course_section_id, grade: nil).save!
    end

    def enroll_laboratories
      LaboratoriesEnroller.new(course: @course).call
    end

    def can_enroll?
      raise Errors::ExceededRegistrationMax unless enough_space?
      raise Errors::AlreadyEnrolled unless not_enrolled?
      raise Errors::MissingPrerequisites unless prerequisites_met?

      true
    end

    def enough_space?
      Fetchers::CurrentCourses.new.call.size < MAX_COURSES_PER_QUARTER
    end

    def not_enrolled?
      StudentSection.where(student_id: @student.id, section_id: @course_section_id).empty?
    end

    def prerequisites_met?
      PrerequisitesChecker.new(course: @course).call
    end
  end
end
