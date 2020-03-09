# frozen_string_literal: true

require './registration/course'

module Administration
  class CourseCreator
    def initialize(name:, code:)
      @course = Registration::Course.new(
        name: name,
        code: code
      )
    end

    def call
      @course.save!
      @course
    end
  end
end
