# frozen_string_literal: true

module Grading
  module Presenters
    class Student
      def initialize(student)
        @student = student
      end

      def call
        "#{@student.name} - #{@student.email}"
      end
    end
  end
end
