# frozen_string_literal: true

require './app/commands/runners/base'
require './administration/quarter_creator'

module App
  module AdminApp
    module Commands
      module Runners
        class QuarterCreator < App::Commands::Runners::Base
          def run
            @logger.print "\nYou are creating a QUARTER"
            @logger.print "\nYear: "
            @year = @logger.get

            @logger.print "\nCode: (1 - Winter, 2 - Spring, 3 - Summer, 4 - Fall) "
            @code = @logger.get

            create

            @logger.print "\n\nCreated successfully!\n"
          end

          private

          def create
            Administration::QuarterCreator.new(
              year: @year,
              code: @code
            ).call
          end
        end
      end
    end
  end
end
