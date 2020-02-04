# frozen_string_literal: true

require_relative 'commands'

module StudentApp
  module Commands
    class Executer
      def run(cmd)
        runner(cmd).run
      end

      private

      def runner(cmd)
        runner = CMD_MAP[cmd] || Runners::Base

        runner.new
      end
    end
  end
end
