# frozen_string_literal: true

require './app/commands/runners/base'
require './registration/presenters/courses_by_name'

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

              if query != 'quit'
                @logger.print "\n=================================\n"
                @logger.print "Results:\n\n"

                courses(query).each do |course|
                  @logger.print course
                end

                @logger.print "\n=================================\n"
              end
            end
          end

          private

          def courses(query)
            return [] if query.nil? || query == '' || query == 'quit'

            Registration::Presenters::CoursesByName.new(query: query).call
          end
        end
      end
    end
  end
end
