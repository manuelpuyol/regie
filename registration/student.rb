# frozen_string_literal: true

require './authentication/user'
require_relative 'course'

module Registration
  class Student < Authentication::User
require_relative 'student_course'
    has_many :student_courses, klass: StudentCourse, dependent: :destroy

    def courses
      student_courses.map(&:course)
    end
  end
end
