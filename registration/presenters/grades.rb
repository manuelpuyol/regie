# frozen_string_literal: true

require_relative 'grade'

module Registration
  module Presenters
    class Grades
      def call
        student_courses.map do |student_course|
          Grade.new(student_course).call
        end.sort
      end

      private

      def student_courses
        raise NotImplementedError
      end
    end
  end
end
