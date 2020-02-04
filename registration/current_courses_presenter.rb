# frozen_string_literal: true

require_relative 'current_courses_fetcher'

module Registration
  class CurrentCoursesPresenter

    # TODO: Actually query courses
    def call
      current_courses.map(&:name)
    end

    private

    def current_courses
      CurrentCoursesFetcher.new.call
    end
  end
end
