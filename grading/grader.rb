# frozen_string_literal: true

require './registration/student_section'
require './db/errors/record_not_found'
require './db/errors/invalid_record_parameters'

module Grading
  class Grader
    def initialize(student_section_id:, grade:)
      @student_section_id = student_section_id
      @grade = grade
    end

    def call
      update_grade if valid?
    end

    private

    def valid?
      raise DB::Errors::RecordNotFound, 'Coult not find Student Section' if student_section.nil?
      raise DB::Errors::InvalidRecordParameters, 'Invalid grade' unless grade_valid?

      true
    end

    def grade_valid?
      Registration::StudentSection::VALID_GRADES.include?(@grade.to_s.upcase)
    end

    def update_grade
      student_section.update(grade: @grade)
    end

    def student_section
      @student_section ||= Registration::StudentSection.find(@student_section_id)
    end
  end
end
