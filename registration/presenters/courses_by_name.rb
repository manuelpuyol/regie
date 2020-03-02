# frozen_string_literal: true

require_relative 'courses'
require_relative '../fetchers/courses_by_name'

module Registration
  module Presenters
    class CoursesByName < Courses
      def initialize(query:)
        @query = query
      end

      private

      def courses
        Registration::Fetchers::CoursesByName.new(@query).call
      end
    end
  end
end
