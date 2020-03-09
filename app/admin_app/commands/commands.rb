# frozen_string_literal: true

require_relative 'runners/quitter'
require_relative 'runners/helper'

module App
  module AdminApp
    module Commands
      CMD_LIST = {
        quit: :quit,
        help: :help
      }.freeze

      CMD_MAP = {
        CMD_LIST[:quit] => Runners::Quitter,
        CMD_LIST[:help] => Runners::Helper
      }.freeze
    end
  end
end
