# frozen_string_literal: true

require_relative '../course'

module Registration
  module Fetchers
    class ExistingCourses
      def call
        Course.all.sort_by(&:code)
      end
    end
  end
end
