# frozen_string_literal: true

require 'singleton'

module Authentication
  class CurrentUser
    include Singleton

    def get
      @user
    end

    def set(user)
      @user = user
    end
  end
end
