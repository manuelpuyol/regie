# frozen_string_literal: true

require_relative '../current_professor_singleton'

module Grading
  module Fetchers
    class CurrentCourseSections
      def initialize
        @professor = CurrentProfessorSingleton.instance.get
      end

      def call
        @professor.current_course_sections
      end
    end
  end
end
