# frozen_string_literal: true

# require_relative 'student_section'
require './registration/presenters/quarter'
require './registration/presenters/course'
require_relative 'student'

module Grading
  module Presenters
    class StudentSections
      def initialize(student_sections)
        @student_sections = student_sections
      end

      def call
        sections
      end

      private

      def sections
        serialized_sections.each_with_object({}) do |section, result|
          quarter = section[:quarter]
          course = section[:course]

          result[quarter] = {} if result[quarter].nil?
          result[quarter][course] = [] if result[quarter][course].nil?

          result[quarter][course] << section[:student]
        end
      end

      def serialized_sections
        @student_sections.map do |section|
          {
            quarter: Registration::Presenters::Quarter.new(section.quarter).call,
            course: Registration::Presenters::Course.new(section.course).call,
            student: Student.new(section.student).call
          }
        end
      end
    end
  end
end
