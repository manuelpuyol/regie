# frozen_string_literal: true

require './app/commands/runners/base'
require './registration/presenters/current_courses'

module App
  module StudentApp
    module Commands
      module Runners
        class CurrentCourseLister < App::Commands::Runners::Base
          def run
            @logger.print "\nHere are your courses for the current quarter:\n\n"

            courses.each do |course|
              @logger.print course
            end

            @logger.print "\n"
          end

          private

          def courses
            Registration::Presenters::CurrentCourses.new.call
          end
        end
      end
    end
  end
end
