# frozen_string_literal: true

require_relative 'runners/quitter'
require_relative 'runners/helper'
require_relative 'runners/current_course_lister'
require_relative 'runners/available_course_lister'
require_relative 'runners/course_searcher'

module App
  module StudentApp
    module Commands
      CMD_LIST = {
        quit: :quit,
        help: :help,
        my_courses: :my_courses,
        list: :list,
        search: :search
      }.freeze

      CMD_MAP = {
        CMD_LIST[:quit] => Runners::Quitter,
        CMD_LIST[:help] => Runners::Helper,
        CMD_LIST[:my_courses] => Runners::CurrentCourseLister,
        CMD_LIST[:list] => Runners::AvailableCourseLister,
        CMD_LIST[:search] => Runners::CourseSearcher
      }.freeze
    end
  end
end
