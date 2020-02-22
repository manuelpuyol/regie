# frozen_string_literal: true

require_relative '../fetchers/current_courses'
require_relative 'courses'

module Registration
  module Presenters
    class CurrentCourses < Courses
      private

      def courses
        Registration::Fetchers::CurrentCourses.new.call
      end
    end
  end
end
