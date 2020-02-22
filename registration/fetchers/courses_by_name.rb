# frozen_string_literal: true

require_relative 'course'

module Registration
  module Fetchers
    class CoursesByName
      def initialize(partial)
        @partial = partial
      end

      def call
        Course.where("name ILIKE %#{partial}%")
      end
    end
  end
end