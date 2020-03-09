# frozen_string_literal: true

require './app/commands/runners/base'
require './registration/presenters/available_courses'

module App
  module StudentApp
    module Commands
      module Runners
        class AvailableCourseLister < App::Commands::Runners::Base
          def run
            @logger.print "\nThese are the available courses for the current quarter:\n\n"

            courses.each do |course|
              @logger.print course
            end

            @logger.print "\n"
          end

          private

          def courses
            Registration::Presenters::AvailableCourses.new.call
          end
        end
      end
    end
  end
end
