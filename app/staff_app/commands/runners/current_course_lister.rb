# frozen_string_literal: true

require './app/commands/runners/base'
require './grading/presenters/current_course_sections'

module App
  module StaffApp
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
            Grading::Presenters::CurrentCourseSections.new.call
          end
        end
      end
    end
  end
end
