# frozen_string_literal: true

module Registration
  class CoursePresenter
    def initialize(course)
      @course = course
    end

    def call
      "#{@course.code} - #{@course.name}"
    end
  end
end
