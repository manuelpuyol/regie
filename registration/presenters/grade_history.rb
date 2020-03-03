# frozen_string_literal: true

require_relative 'grades'
require_relative '../fetchers/grade_history'

module Registration
  module Presenters
    class GradeHistory < Grades
      private

      def student_courses
        Registration::Fetchers::GradeHistory.new.call
      end
    end
  end
end
