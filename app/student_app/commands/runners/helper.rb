# frozen_string_literal: true

require './app/commands/runners/base'

module App
  module StudentApp
    module Commands
      module Runners
        class Helper < App::Commands::Runners::Base
          def run
            @logger.print "\nYou are logged in as a student"
            @logger.print "\n==============================================\n\n"
            @logger.print "Here are the available commands you may use:\n\n"
            @logger.print "#{cmd(:my_courses)} - list your current courses"
            @logger.print "#{cmd(:list)} - list available courses"
            @logger.print "#{cmd(:quit)} - quits the application"
            @logger.print "#{cmd(:help)} - prints this help message\n\n"
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
