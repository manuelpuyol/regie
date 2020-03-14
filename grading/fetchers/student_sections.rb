# frozen_string_literal: true

require_relative '../current_professor_singleton'

module Grading
  module Fetchers
    class StudentSections
      def initialize
        @professor = CurrentProfessorSingleton.instance.get
      end

      def call
        @professor.course_sections.map(&:student_sections).flatten
      end
    end
  end
end
