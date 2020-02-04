# frozen_string_literal: true

require './authentication/current_user_singleton'
require_relative 'laboratory_enroller'
require_relative 'course_laboratories_fetcher'

module Registration
  class LaboratoriesEnroller
    def initialize(course:)
      @course = course
      @student = Authentication::CurrentUserSingleton.instance.get
    end

    # TODO: Actually enroll a student in a laboratory
    def call
      enrollments.all?
    end

    private

    def enrollments
      laboratories.map do |lab|
        LaboratoryEnroller.new(laboratory: lab).call
      end
    end

    def laboratories
      CourseLaboratoriesFetcher.new(course: @course).call
    end
  end
end
