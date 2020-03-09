# frozen_string_literal: true

require './app/commands/runners/base'

module App
  module AdminApp
    module Commands
      module Runners
        class Helper < App::Commands::Runners::Base
          def run
            @logger.print "\nYou are logged in as a staff member"
            @logger.print "\n==============================================\n\n"
            @logger.print "Here are the available commands you may use:\n\n"
            @logger.print "#{cmd(:student_create)} - creates a student"
            @logger.print "#{cmd(:staff_create)} - creates a staff member"
            @logger.print "#{cmd(:admin_create)} - creates an admin"
            @logger.print "#{cmd(:quit)} - quits the application"
            @logger.print "#{cmd(:help)} - prints this help message\n\n"
          end

          private

          def cmd(action)
            AdminApp::Commands::CMD_LIST[action]
          end
        end
      end
    end
  end
end
