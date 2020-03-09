# frozen_string_literal: true

require_relative 'grade'

module Registration
  module Presenters
    class Grades
      def call
        student_sections.map do |student_section|
          Grade.new(student_section).call
        end.sort
      end

      private

      def student_sections
        raise NotImplementedError
      end
    end
  end
end
