# frozen_string_literal: true

require './db/mysql/record'

module Registration
  class CourseSection < DB::MySQL::Record
    attr_accessor :id, :quarter_id, :course_id, :created_at, :updated_at

    def self.column_names
      %w[id quarter_id course_id created_at updated_at]
    end

    require_relative 'quarter'
    belongs_to :quarter, klass: Quarter

    require_relative 'course'
    belongs_to :course, klass: Course

    require_relative 'student_section'
    has_many :student_sections, klass: StudentSection
  end
end
