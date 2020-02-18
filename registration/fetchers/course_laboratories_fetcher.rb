# frozen_string_literal: true

require_relative '../laboratory'

module Registration
  module Fetchers
    class CourseLaboratoriesFetcher
      def initialize(course:)
        @course = course
      end

      # TODO: Actually query laboratories
      def call
        [
          Laboratory.new(name: 'MPCS 51044L'),
          Laboratory.new(name: 'MPCS 53110L'),
          Laboratory.new(name: 'MPCS 51410L')
        ]
      end
    end
  end
end
