# frozen_string_literal: true

require './app/commands/runners/base'

module App
  module StaffApp
    module Commands
      module Runners
        class Helper < App::Commands::Runners::Base
          def run
            @logger.print "\nYou are logged in as a staff member"
            @logger.print "\n==============================================\n\n"
            @logger.print "Here are the available commands you may use:\n\n"
            @logger.print "#{cmd(:list)} - list your current courses with students"
            @logger.print "#{cmd(:quit)} - quits the application"
            @logger.print "#{cmd(:help)} - prints this help message\n\n"
          end

          private

          def cmd(action)
            StaffApp::Commands::CMD_LIST[action]
          end
        end
      end
    end
  end
end
