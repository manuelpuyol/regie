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

            grades.each do |course|
              @logger.print course
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
