# frozen_string_literal: true

require_relative 'courses'
require_relative '../fetchers/existing_courses'

module Registration
  module Presenters
    class ExistingCourses < Courses
      private

      def courses
        Registration::Fetchers::ExistingCourses.new.call
      end
    end
  end
end
