# frozen_string_literal: true

require './app/commands/runners/base'

module App
  module AdminApp
    module Commands
      module Runners
        class Quitter < App::Commands::Runners::Base
          def run
            @logger.print 'Safely quitting'
            AdminApp::Runner.stop
          end
        end
      end
    end
  end
end
