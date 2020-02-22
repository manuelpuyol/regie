# frozen_string_literal: true

require './app/commands/runners/base'

module App
  module StudentApp
    module Commands
      module Runners
        class CourseSearcher < App::Commands::Runners::Base
          def run
            query = nil

            while query != 'quit'
              @logger.print "\nLeave by searching quit"
              @logger.print 'Search by pressing ENTER'
              @logger.print "\nYou can now search a course by name:\n\n"

              query = @logger.get

              @logger.print query
            end
          end

          private

          def courses(query)
            return if query.nil?
            # Registration::Presenters::AvailableCourses.new.call
          end
        end
      end
    end
  end
end
