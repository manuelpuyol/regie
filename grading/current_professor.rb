# frozen_string_literal: true

require './authentication/current_user_singleton'
require_relative 'professor'

module Grading
  class CurrentProfessor
    def initialize
      @professor = Professor.new(Authentication::CurrentUserSingleton.instance.get)
    end

    def get
      @professor
    end

    def set(professor)
      @professor = professor
    end
  end
end
