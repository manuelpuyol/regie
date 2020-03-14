# frozen_string_literal: true

require 'singleton'
require_relative 'current_professor'

module Grading
  class CurrentProfessorSingleton < CurrentProfessor
    include Singleton
  end
end
