# frozen_string_literal: true

require './app/commands/runners/base'
require './registration/available_courses_presenter'

module App
  module StudentApp
    module Commands
      module Runners
        class AvailableCourseLister < App::Commands::Runners::Base
          def run
            @logger.print "\nThese are the available courses:\n\n"

            courses.each do |course|
              @logger.print course
            end

            @logger.print "\n"
          end

          private

          def courses
            Registration::AvailableCoursesPresenter.new.call
          end
        end
      end
    end
  end
end
