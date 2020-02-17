# frozen_string_literal: true

require './authentication/user'
# require_relative 'student_course'
# require_relative 'course'

module Registration
  class Student < Authentication::User
    has_many :student_courses, klass: StudentCourse, dependent: :destroy

    def courses
      student_courses.map(&:course)
    end
  end
end
