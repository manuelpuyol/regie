# frozen_string_literal: true

require './authentication/user'

module Registration
  class Student < Authentication::User
    require_relative 'student_section'
    has_many :student_sections, klass: StudentSection, dependent: :destroy, foreign_key: 'student_id'

    def courses
      student_sections.map(&:course_section).map(&:course)
    end
  end
end
