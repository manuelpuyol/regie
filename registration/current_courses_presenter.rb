# frozen_string_literal: true

require_relative 'current_courses_fetcher'
require_relative 'course_presenter'

module Registration
  class CurrentCoursesPresenter
    def call
      current_courses.map do |course|
        CoursePresenter.new(course).call
      end
    end

    private

    def current_courses
      CurrentCoursesFetcher.new.call
    end
  end
end
