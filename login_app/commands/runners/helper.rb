# frozen_string_literal: true

require_relative 'base'

module LoginApp
  module Commands
    module Runners
      class Helper < Base
        def run
          @logger.print "\n\nWelcome to MPCS 51410 REGIE System!"
          @logger.print 'This is a program developed by Manuel Puyol'
          @logger.print "===================================================\n"
          @logger.print "Here are the available commands you may use:\n"
          @logger.print "#{cmd(:login)} - starts login procedure"
          @logger.print "#{cmd(:quit)} - quits the application"
          @logger.print "#{cmd(:help)} - prints this help message\n"
        end

        private

        def cmd(action)
          LoginApp::Commands::CMD_LIST[action]
        end
      end
    end
  end
end
