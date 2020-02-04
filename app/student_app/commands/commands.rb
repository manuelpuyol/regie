# frozen_string_literal: true

require_relative 'runners/quitter'
require_relative 'runners/helper'
require_relative 'runners/course_lister'

module App
  module StudentApp
    module Commands
      CMD_LIST = {
        quit: :quit,
        help: :help,
        courses: :courses
      }.freeze

      CMD_MAP = {
        CMD_LIST[:quit] => Runners::Quitter,
        CMD_LIST[:help] => Runners::Helper,
        CMD_LIST[:courses] => Runners::CourseLister
      }.freeze
    end
  end
end
