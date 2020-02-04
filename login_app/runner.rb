# frozen_string_literal: true

require './custom_io/logger'
require_relative 'commands/commands'
require_relative 'commands/executer'

module LoginApp
  class Runner
    def initialize
      @@running = true # rubocop:disable Style/ClassVars
      @logger = CustomIO::Logger.new
      @cmd_executer = Commands::Executer.new
    end

    def start
      @cmd_executer.run(help_cmd)

      while @@running
        print '[LoginApp] $> '
        cmd = @logger.get_cmd
        @cmd_executer.run(cmd)
      end
    end

    def self.stop
      @@running = false # rubocop:disable Style/ClassVars
    end

    private

    def help_cmd
      Commands::CMD_LIST[:help]
    end
  end
end
