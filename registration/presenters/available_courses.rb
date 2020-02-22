# frozen_string_literal: true

require_relative 'courses'
require_relative '../fetchers/available_courses_fetcher'

module Registration
  module Presenters
    class AvailableCourses < Courses
      private

      def courses
        Registration::Fetchers::AvailableCoursesFetcher.new.call
      end
    end
  end
end
