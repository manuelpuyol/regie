# frozen_string_literal: true

require 'singleton'
require './authentication/current_user_singleton'
require_relative 'student'

module Registration
  class CurrentStudentSingleton
    include Singleton

    def get
      @student ||= Student.new(Authentication::CurrentUserSingleton.instance.get)
    end

    def set(student)
      @student = student
    end
  end
end
