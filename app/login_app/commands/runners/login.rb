# frozen_string_literal: true

require './app/student_app/runner'
require_relative 'base'

module App
  module LoginApp
    module Commands
      module Runners
        class Login < Base
          def run
            read_username
            read_password

            login
          end

          private

          def login
            # TODO: Create real login service
            LoginApp::Runner.stop
            App::StudentApp::Runner.new.start
          end

          def read_username
            print '[LoginApp] username: '
            @username = @logger.get
          end

          def read_password
            print '[LoginApp] password: '
            @password = @logger.get
          end
        end
      end
    end
  end
end
