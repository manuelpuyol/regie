# frozen_string_literal: true

require './app/commands/runners/base'
require './registration/presenters/grade_history'

module App
  module StudentApp
    module Commands
      module Runners
        class GradeLister < App::Commands::Runners::Base
          def run
            @logger.print "\nHere are your grades:\n\n"

            grades.each do |quarter, courses|
              @logger.print '=============='
              @logger.print quarter
              @logger.print "==============\n"

              courses.each do |course|
                @logger.print course
              end
            end

            @logger.print "\n"
          end

          private

          def grades
            Registration::Presenters::GradeHistory.new.call
          end
        end
      end
    end
  end
end
