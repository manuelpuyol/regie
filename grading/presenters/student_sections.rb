# frozen_string_literal: true

# require_relative 'student_section'
require './registration/presenters/quarter'
require './registration/presenters/course'
require_relative '../fetchers/student_sections'
require_relative 'student'

module Grading
  module Presenters
    class StudentSections
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

          result[quarter][course] << {
            label: section[:student],
            id: section[:id]
          }
        end
      end

      def serialized_sections
        student_sections.map do |section|
          {
            id: section.id,
            quarter: Registration::Presenters::Quarter.new(section.quarter).call,
            course: Registration::Presenters::Course.new(section.course).call,
            student: Student.new(section.student).call
          }
        end
      end

      def student_sections
        Grading::Fetchers::StudentSections.new.call
      end
    end
  end
end
