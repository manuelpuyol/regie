# frozen_string_literal: true

require 'singleton'
require_relative 'current_student'

module Registration
  class CurrentStudentSingleton < CurrentStudent
    include Singleton
  end
end
