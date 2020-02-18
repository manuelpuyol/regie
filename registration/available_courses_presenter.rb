# frozen_string_literal: true

require_relative 'course_presenter'
require_relative 'available_courses_fetcher'

module Registration
  class AvailableCoursesPresenter
    def call
      sorted_courses.map do |course|
        CoursePresenter.new(course).call
      end
    end

    private

    def sorted_courses
      courses.sort_by(&:code)
    end

    def courses
      AvailableCoursesFetcher.new.call
    end
  end
end
