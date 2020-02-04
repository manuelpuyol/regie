# frozen_string_literal: true

require './authentication/current_user'

module Registration
  class CurrentCoursesFetcher
    def initialize
      @user = Authentication::CurrentUser.instance.get
    end

    # TODO: Actually query courses
    def call
      [
        'MPCS 51044 C/C++ for Advanced Programmers',
        'MPCS 53110 Foundations of Data Analysis',
        'MPCS 514101 Object Oriented Programming'
      ]
    end
  end
end
