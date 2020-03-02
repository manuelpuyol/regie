# frozen_string_literal: true

require './db/mysql/record'
require_relative 'student'
require_relative 'course'

module Registration
  class StudentCourse < DB::MySQL::Record
    attr_accessor :id, :student_id, :course_id, :grade, :created_at, :updated_at

    def self.column_names
      %w[id student_id course_id grade created_at updated_at]
    end

    belongs_to :student, klass: Student
    belongs_to :course, klass: Course
  end
end
