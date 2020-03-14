# frozen_string_literal: true

require_relative '../current_professor_singleton'

module Grading
  module Fetchers
    class CurrentCourses
      def initialize
        @professor = CurrentProfessorSingleton.instance.get
      end

      def call
        @professor.current_courses
      end
    end
  end
end
