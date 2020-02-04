# frozen_string_literal: true

require_relative 'base'

module App
  module LoginApp
    module Commands
      module Runners
        class Quitter < Base
          def run
            logger.print 'Safely quitting'
            LoginApp::Runner.stop
          end
        end
      end
    end
  end
end
