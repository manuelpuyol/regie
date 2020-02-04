# frozen_string_literal: true

require './authentication/current_user'
require_relative 'course'

module Registration
  class CurrentCoursesFetcher
    def initialize
      @user = Authentication::CurrentUser.instance.get
    end

    # TODO: Actually query courses
    def call
      [
        Course.new(name: 'MPCS 51044 C/C++ for Advanced Programmers'),
        Course.new(name: 'MPCS 53110 Foundations of Data Analysis'),
        Course.new(name: 'MPCS 514101 Object Oriented Programming')
      ]
    end
  end
end
