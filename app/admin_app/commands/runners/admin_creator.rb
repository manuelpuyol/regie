# frozen_string_literal: true

require './app/commands/runners/base'
require './administration/user_creator'

module App
  module AdminApp
    module Commands
      module Runners
        class AdminCreator < App::Commands::Runners::Base
          def run
            @logger.print "\nYou are creating an ADMIN"
            print "\nName: "
            @name = @logger.get

            print "\nEmail: "
            @email = @logger.get

            print "\nPassword: "
            @password = @logger.get

            create

            @logger.print "\n\nCreated successfully!\n"
          end

          private

          def create
            Administration::UserCreator.new(
              name: @name,
              email: @email,
              password: @password,
              type: :admin
            ).call
          end
        end
      end
    end
  end
end
