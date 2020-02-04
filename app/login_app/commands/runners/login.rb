# frozen_string_literal: true

require './app/student_app/runner'
require './app/commands/runners/base'
require './authentication/authenticator'

module App
  module LoginApp
    module Commands
      module Runners
        class Login < App::Commands::Runners::Base
          def run
            read_username
            read_password

            login
          end

          private

          def login
            LoginApp::Runner.stop
            StudentApp::Runner.new.start if authenticator.password_match?
          end

          def authenticator
            Authentication::Authenticator.new(@username, @password)
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
