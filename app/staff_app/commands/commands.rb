# frozen_string_literal: true

require_relative 'runners/quitter'
require_relative 'runners/helper'
require_relative 'runners/current_course_lister'
require_relative 'runners/grader'

module App
  module StaffApp
    module Commands
      CMD_LIST = {
        list: :list,
        grade: :grade,
        quit: :quit,
        help: :help
      }.freeze

      CMD_MAP = {
        CMD_LIST[:list] => Runners::CurrentCourseLister,
        CMD_LIST[:grade] => Runners::Grader,
        CMD_LIST[:quit] => Runners::Quitter,
        CMD_LIST[:help] => Runners::Helper
      }.freeze
    end
  end
end
