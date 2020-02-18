# frozen_string_literal: true

require_relative 'course_presenter'

module Registration
  module Presenters
    class CoursesPresenter
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
        raise NotImplementedError
      end
    end
  end
end
