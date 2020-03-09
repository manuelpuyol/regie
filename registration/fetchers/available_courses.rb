# frozen_string_literal: true

require_relative '../course_section'
require_relative '../current_quarter_singleton'

module Registration
  module Fetchers
    class AvailableCourses
      def call
        CourseSection.where(quarter_id: Registration::CurrentQuarterSingleton.instance.get.id).map(&:course)
      end
    end
  end
end
