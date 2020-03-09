# frozen_string_literal: true

require_relative 'grade'

module Registration
  module Presenters
    class Grades
      def call
        grouped_sections.each_with_object({}) do |(key, values), hash|
          hash[key] = values.map do |student_section|
            Grade.new(student_section).call
          end.sort
        end
      end

      private

      def grouped_sections
        student_sections.group_by do |section|
          "#{section.quarter.year} - #{section.quarter.code}"
        end
      end

      def student_sections
        raise NotImplementedError
      end
    end
  end
end
