# frozen_string_literal: true

require_relative 'course'

module Registration
  module Presenters
    class Grade
      def initialize(student_course)
        @student_course = student_course
      end

      def call
        "#{course} => #{@student_course.grade}"
      end

      private

      def course
        Course.new(@student_course.course).call
      end
    end
  end
end
