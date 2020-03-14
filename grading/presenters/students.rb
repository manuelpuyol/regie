# frozen_string_literal: true

require_relative 'student'

module Grading
  module Presenters
    class Students
      def initialize(students)
        @students = students
      end

      def call
        sorted_students.map do |student|
          Student.new(student).call
        end
      end

      private

      def sorted_students
        @students.sort_by(&:name)
      end
    end
  end
end
