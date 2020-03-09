# frozen_string_literal: true

require './app/commands/runners/base'
require './administration/course_creator'

module App
  module AdminApp
    module Commands
      module Runners
        class CourseCreator < App::Commands::Runners::Base
          def run
            @logger.print "\nYou are creating a COURSE"
            @logger.print "\nName: "
            @name = @logger.get

            @logger.print "\nCode: "
            @code = @logger.get

            create
          end

          private

          def create
            Administration::CourseCreator.new(
              name: @name,
              code: @code
            ).call
          end
        end
      end
    end
  end
end
