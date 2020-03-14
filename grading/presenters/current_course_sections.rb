# frozen_string_literal: true

require_relative '../fetchers/current_course_sections'
require_relative 'course_sections'

module Grading
  module Presenters
    class CurrentCourseSections
      def call
        CourseSections.new(sections).call
      end

      private

      def sections
        Grading::Fetchers::CurrentCourseSections.new.call
      end
    end
  end
end
