# frozen_string_literal: true

require_relative 'runners/quitter'
require_relative 'runners/helper'
require_relative 'runners/login'
require_relative 'runners/password_resetter'

module App
  module LoginApp
    module Commands
      CMD_LIST = {
        quit: :quit,
        pass: :pass,
        help: :help,
        login: :login
      }.freeze

      CMD_MAP = {
        CMD_LIST[:quit] => Runners::Quitter,
        CMD_LIST[:help] => Runners::Helper,
        CMD_LIST[:login] => Runners::Login,
        CMD_LIST[:pass] => Runners::PasswordResetter
      }.freeze
    end
  end
end
