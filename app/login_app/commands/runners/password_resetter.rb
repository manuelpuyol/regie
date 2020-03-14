# frozen_string_literal: true

require './db/errors/record_not_found'
require './app/commands/runners/base'
require './authentication/password_updater'

module App
  module LoginApp
    module Commands
      module Runners
        class PasswordResetter < App::Commands::Runners::Base
          def run
            read_email
            read_old_password
            read_new_password

            update_password

            @logger.print 'Updated successfully!'
          rescue DB::Errors::RecordNotFound => e
            @logger.print e.message
          end

          private

          def update_password
            Authentication::PasswordUpdater.new(email: @email, old_password: @old_password, new_password: @new_password).call
          end

          def read_email
            print '[LoginApp] email: '
            @email = @logger.get
          end

          def read_old_password
            print '[LoginApp] old password: '
            @old_password = @logger.get
          end

          def read_new_password
            print '[LoginApp] new password: '
            @new_password = @logger.get
          end
        end
      end
    end
  end
end
