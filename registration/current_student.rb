# frozen_string_literal: true

require './authentication/current_user_singleton'
require_relative 'student'

module Registration
  class CurrentStudent
    def initialize
      @student = Student.new(Authentication::CurrentUserSingleton.instance.get)
    end

    def get
      @student
    end

    def set(student)
      @student = student
    end
  end
end
