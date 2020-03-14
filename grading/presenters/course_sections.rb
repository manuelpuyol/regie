# frozen_string_literal: true

require_relative 'course_section'

module Grading
  module Presenters
    class CourseSections
      def initialize(sections)
        @sections = sections
      end

      def call
        sorted_sections.map do |section|
          CourseSection.new(section).call
        end
      end

      private

      def sorted_sections
        @sections.sort_by do |section|
          section.course.code
        end
      end
    end
  end
end
