# frozen_string_literal: true

require './app/commands/runners/base'

module App
  module StudentApp
    module Commands
      module Runners
        class Helper < App::Commands::Runners::Base
          def run
            @logger.print "==================================================\n"
            @logger.print "Here are the available commands you may use:\n"
            @logger.print "#{cmd(:quit)} - quits the application"
            @logger.print "#{cmd(:help)} - prints this help message\n"
          end

          private

          def cmd(action)
            StudentApp::Commands::CMD_LIST[action]
          end
        end
      end
    end
  end
end
