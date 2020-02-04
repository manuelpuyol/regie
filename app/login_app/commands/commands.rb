# frozen_string_literal: true

require_relative 'runners/quitter'
require_relative 'runners/helper'
require_relative 'runners/login'

module App
  module LoginApp
    module Commands
      CMD_LIST = {
        quit: :quit,
        help: :help,
        login: :login
      }.freeze

      CMD_MAP = {
        CMD_LIST[:quit] => Runners::Quitter,
        CMD_LIST[:help] => Runners::Helper,
        CMD_LIST[:login] => Runners::Login
      }.freeze
    end
  end
end
