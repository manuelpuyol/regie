# frozen_string_literal: true

require_relative 'current_courses_fetcher'

module Registration
  class CurrentCoursesPresenter
    def call
      current_courses.map do |course|
        "#{course.code} - #{course.name}"
      end
    end

    private

    def current_courses
      CurrentCoursesFetcher.new.call
    end
  end
end
