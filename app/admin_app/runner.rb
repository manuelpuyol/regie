# frozen_string_literal: true

require './app/custom_io/logger'
require './app/base_runner'
require_relative 'commands/commands'

module App
  module AdminApp
    class Runner < App::BaseRunner
      def initialize(user)
        @user = user
        super()
      end

      private

      def app_name
        'AdminApp'
      end

      def help_cmd
        Commands::CMD_LIST[:help]
      end

      def cmd_map
        Commands::CMD_MAP
      end
    end
  end
end
