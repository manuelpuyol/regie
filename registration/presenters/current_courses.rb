# frozen_string_literal: true

require_relative '../fetchers/current_courses_fetcher'
require_relative 'courses'

module Registration
  module Presenters
    class CurrentCourses < Courses
      private

      def courses
        Registration::Fetchers::CurrentCoursesFetcher.new.call
      end
    end
  end
end
