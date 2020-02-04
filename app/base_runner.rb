# frozen_string_literal: true

require './app/custom_io/logger'
require_relative 'commands/executer'

module App
  class BaseRunner
    def initialize
      @@running = true # rubocop:disable Style/ClassVars
      @logger = CustomIO::Logger.new
      @cmd_executer = Commands::Executer.new(cmd_map)
    end

    def start
      @cmd_executer.run(help_cmd)

      while @@running
        print "[#{app_name}] $> "
        cmd = @logger.get_cmd
        @cmd_executer.run(cmd)
      end
    end

    def self.stop
      @@running = false # rubocop:disable Style/ClassVars
    end

    private

    def cmd_map
      raise NotImplementedError
    end

    def app_name
      raise NotImplementedError
    end

    def help_cmd
      raise NotImplementedError
    end
  end
end
