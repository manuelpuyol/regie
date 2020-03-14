# frozen_string_literal: true

require './registration/course_section'
require './authentication/user'
require './db/errors/record_not_found'

module Administration
  class CourseSectionCreator
    def initialize(course_id:, quarter_id:, professor_email:)
      @course_id = course_id
      @quarter_id = quarter_id
      @professor_email = professor_email
    end

    def call
      if valid?
        create
      else
        raise DB::Errors::RecordNotFound, "Couldn't find a professor with email #{@professor_email}"
      end
    end

    private

    def valid?
      !professor.nil?
    end

    def create
      course_section.save!
      course_section
    end

    def professor
      @professor ||= Authentication::User.where(email: @professor_email, type: Authentication::User::TYPES[:staff]).first
    end

    def course_section
      @course_section ||= Registration::CourseSection.new(
        course_id: @course_id,
        quarter_id: @quarter_id,
        professor_id: @professor.id
      )
    end
  end
end
