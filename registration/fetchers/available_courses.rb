# frozen_string_literal: true

require_relative '../course_section'
require_relative '../current_quarter_singleton'

module Registration
  module Fetchers
    class AvailableCourses
      def initialize
        @quarter = Registration::CurrentQuarterSingleton.instance.get
      end

      def call
        CourseSection.where(quarter_id: @quarter.id).map(&:course)
      end
    end
  end
end
