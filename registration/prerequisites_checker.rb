# frozen_string_literal: true

require './authentication/current_user_singleton'

module Registration
  class PrerequisitesChecker
    def initialize(course:)
      @course = course
      @student = Authentication::CurrentUserSingleton.instance.get
    end

    # TODO: Actually check prerequisites
    def call
      true
    end
  end
end
