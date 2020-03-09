# frozen_string_literal: true

require './db/mysql/record'

module Registration
  class StudentSection < DB::MySQL::Record
    attr_accessor :id, :student_id, :section_id, :grade, :created_at, :updated_at

    def self.column_names
      %w[id student_id section_id grade created_at updated_at]
    end

    require_relative 'student'
    belongs_to :student, klass: Student

    require_relative 'course_section'
    belongs_to :course_section, klass: CourseSection, foreign_key: 'section_id'

    def course
      course_section.course
    end
  end
end
