# frozen_string_literal: true

require './registration/course_section'

module Administration
  class CourseSectionCreator
    def initialize(course_id:, quarter_id:)
      @course_section = Registration::CourseSection.new(
        course_id: course_id,
        quarter_id: quarter_id
      )
    end

    def call
      @course_section.save!
      @course_section
    end
  end
end
