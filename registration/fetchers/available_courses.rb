# frozen_string_literal: true

require_relative '../course'

module Registration
  module Fetchers
    class AvailableCourses
      def call
        Course.all
      end
    end
  end
end
