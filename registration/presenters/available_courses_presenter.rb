# frozen_string_literal: true

require_relative 'courses_presenter'
require_relative '../fetchers/available_courses_fetcher'

module Registration
  module Presenters
    class AvailableCoursesPresenter < CoursesPresenter
      private

      def courses
        Registration::Fetchers::AvailableCoursesFetcher.new.call
      end
    end
  end
end
