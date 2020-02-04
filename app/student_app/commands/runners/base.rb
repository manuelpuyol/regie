# frozen_string_literal: true

require './app/custom_io/logger'

module App
  module StudentApp
    module Commands
      module Runners
        class Base
          attr_reader :logger

          def initialize
            @logger = CustomIO::Logger.new
          end

          def run
            @logger.print 'Command not found, please try again'
          end
        end
      end
    end
  end
end
