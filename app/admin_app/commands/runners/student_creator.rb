# frozen_string_literal: true

require './app/commands/runners/base'
require './administration/user_creator'

module App
  module AdminApp
    module Commands
      module Runners
        class StudentCreator < App::Commands::Runners::Base
          def run
            @logger.print "\nYou are creating a STUDENT"
            @logger.print "\nName: "
            name = @logger.get

            @logger.print "\nEmail: "
            name = @logger.get

            @logger.print "\nPassword: "
            pass = @logger.get
          end
        end
      end
    end
  end
end
