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
            @logger.print "\nName: "
            @name = @logger.get

            @logger.print "\nEmail: "
            @email = @logger.get

            @logger.print "\nPassword: "
            @password = @logger.get

            create
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