# frozen_string_literal: true

require './app/commands/runners/base'

module App
  module StudentApp
    module Commands
      module Runners
        class CourseLister < App::Commands::Runners::Base
          def run
            @logger.print "Here are your courses:\n"
            
          end

          private

          def courses
          end
        end
      end
    end
  end
end
