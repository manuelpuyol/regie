# frozen_string_literal: true

require_relative 'courses'
require_relative '../fetchers/available_courses'

module Registration
  module Presenters
    class AvailableCourses < Courses
      private

      def courses
        Registration::Fetchers::AvailableCourses.new.call
      end
    end
  end
end
