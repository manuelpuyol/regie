# frozen_string_literal: true

require 'singleton'
require_relative 'current_user'

module Authentication
  class CurrentUserSingleton < CurrentUser
    include Singleton
  end
end
