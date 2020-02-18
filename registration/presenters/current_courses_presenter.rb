# frozen_string_literal: true

require_relative '../fetchers/current_courses_fetcher'
require_relative 'courses_presenter'

module Registration
  module Presenters
    class CurrentCoursesPresenter < CoursesPresenter
      private

      def courses
        Registration::Fetchers::CurrentCoursesFetcher.new.call
      end
    end
  end
end
