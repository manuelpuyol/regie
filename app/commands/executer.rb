# frozen_string_literal: true

require_relative 'runners/base'

module App
  module Commands
    class Executer
      def initialize(cmd_map)
        @cmd_map = cmd_map
      end

      def run(cmd)
        runner(cmd).run
      end

      private

      def runner(cmd)
        runner = @cmd_map[cmd] || Runners::Base

        runner.new
      end
    end
  end
end
