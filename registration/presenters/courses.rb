# frozen_string_literal: true

require_relative 'course'

module Registration
  module Presenters
    class Courses
      def call
        sorted_courses.map do |course|
          Course.new(course).call
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
