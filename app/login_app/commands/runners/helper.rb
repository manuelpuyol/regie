# frozen_string_literal: true

require './app/commands/runners/base'

module App
  module LoginApp
    module Commands
      module Runners
        class Helper < App::Commands::Runners::Base
          def run
            @logger.print "\nWelcome to MPCS 51410 REGIE System!"
            @logger.print 'This is a program developed by Manuel Puyol'
            @logger.print "\n==============================================\n\n"
            @logger.print "Here are the available commands you may use:\n\n"
            @logger.print "#{cmd(:login)} - starts login procedure"
            @logger.print "#{cmd(:quit)} - quits the application"
            @logger.print "#{cmd(:help)} - prints this help message\n\n"
          end

          private

          def cmd(action)
            LoginApp::Commands::CMD_LIST[action]
          end
        end
      end
    end
  end
end
