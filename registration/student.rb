# frozen_string_literal: true

require './authentication/user'

module Registration
  class Student < Authentication::User
    require_relative 'student_course'
    has_many :student_courses, klass: StudentCourse, dependent: :destroy, foreign_key: 'student_id'

    def courses
      student_courses.map(&:course)
    end
  end
end
