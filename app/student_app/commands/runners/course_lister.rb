# frozen_string_literal: true

require './app/commands/runners/base'
require './registration/current_courses_presenter'

module App
  module StudentApp
    module Commands
      module Runners
        class CourseLister < App::Commands::Runners::Base
          def run
            @logger.print "\nHere are your courses:\n\n"

            courses.each do |course|
              @logger.print course
            end

            @logger.print "\n"
          end

          private

          def courses
            Registration::CurrentCoursesPresenter.new.call
          end
        end
      end
    end
  end
end
