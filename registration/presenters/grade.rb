# frozen_string_literal: true

require_relative 'course'

module Registration
  module Presenters
    class Grade
      def initialize(student_section)
        @student_section = student_section
      end

      def call
        "#{course} => #{@student_section.grade}"
      end

      private

      def course
        Course.new(@student_section.course).call
      end
    end
  end
end
