# frozen_string_literal: true

require_relative '../course'
require_relative 'available_courses'

module Registration
  module Fetchers
    class CoursesByName
      def initialize(partial)
        @partial = partial
      end

      def call
        Course.where("id IN (#{course_ids.join(', ')}) AND LOWER(name) LIKE '%#{@partial}%'")
      end

      private

      def course_ids
        AvailableCourses.new.call.map(&:id)
      end
    end
  end
end
