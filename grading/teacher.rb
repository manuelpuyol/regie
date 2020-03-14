# frozen_string_literal: true

require './authentication/user'
require './registration/course_section'

module Grading
  class Teacher < Authentication::User
    require './registration/course_section'
    has_many :course_sections, klass: Registration::CourseSection, dependent: :destroy, foreign_key: 'teacher_id'

    def courses
      course_sections.map(&:course)
    end

    def current_courses
      course_sections.select do |section|
        section.quarter.active?
      end.map(&:course)
    end
  end
end
