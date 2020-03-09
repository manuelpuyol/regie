# frozen_string_literal: true

require_relative 'runners/student_creator'
require_relative 'runners/staff_creator'
require_relative 'runners/admin_creator'
require_relative 'runners/quitter'
require_relative 'runners/helper'

module App
  module AdminApp
    module Commands
      CMD_LIST = {
        student_create: :student_create,
        staff_create: :staff_create,
        admin_create: :admin_create,
        quit: :quit,
        help: :help
      }.freeze

      CMD_MAP = {
        CMD_LIST[:student_create] => Runners::StudentCreator,
        CMD_LIST[:staff_create] => Runners::StaffCreator,
        CMD_LIST[:admin_create] => Runners::AdminCreator,
        CMD_LIST[:quit] => Runners::Quitter,
        CMD_LIST[:help] => Runners::Helper
      }.freeze
    end
  end
end
