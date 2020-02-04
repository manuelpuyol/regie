# frozen_string_literal: true

require './authentication/current_user_singleton'

module Registration
  class LaboratoryEnroller
    def initialize(laboratory:)
      @laboratory = laboratory
      @student = Authentication::CurrentUserSingleton.instance.get
    end

    # TODO: Actually enroll a student in a laboratory
    def call
      true
    end
  end
end
