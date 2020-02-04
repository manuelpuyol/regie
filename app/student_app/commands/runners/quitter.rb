# frozen_string_literal: true

require_relative 'base'

module App
  module StudentApp
    module Commands
      module Runners
        class Quitter < Base
          def run
            logger.print 'Safely quitting'
            StudentApp::Runner.stop
          end
        end
      end
    end
  end
end