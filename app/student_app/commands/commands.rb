# frozen_string_literal: true

require_relative 'runners/quitter'
require_relative 'runners/helper'
require_relative 'runners/current_course_lister'

module App
  module StudentApp
    module Commands
      CMD_LIST = {
        quit: :quit,
        help: :help,
        my_courses: :my_courses
      }.freeze

      CMD_MAP = {
        CMD_LIST[:quit] => Runners::Quitter,
        CMD_LIST[:help] => Runners::Helper,
        CMD_LIST[:my_courses] => Runners::CurrentCourseLister
      }.freeze
    end
  end
end
