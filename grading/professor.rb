# frozen_string_literal: true

require './authentication/user'
require './registration/course_section'

module Grading
  class Professor < Authentication::User
    require './registration/course_section'
    has_many :course_sections, klass: Registration::CourseSection, dependent: :destroy, foreign_key: 'professor_id'

    def courses
      course_sections.map(&:course)
    end

    def current_course_sections
      course_sections.select do |section|
        section.quarter.active?
      end
    end
  end
end
