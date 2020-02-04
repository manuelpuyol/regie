# frozen_string_literal: true

require 'singleton'

module Authentication
  class CurrentUser
    include Singleton

    def initialize
      @user = nil
    end

    def get
      @user
    end

    def set(user)
      @user = user
    end
  end
end
