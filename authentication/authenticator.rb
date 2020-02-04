# frozen_string_literal: true

require_relative 'current_user_singleton'

module Authentication
  class Authenticator
    def initialize(username:, password:)
      @username = username
      @password = password
    end

    def call
      CurrentUserSingleton.instance.set(user) if password_match?
    end

    private

    # TODO: actually check password
    def password_match?
      true
    end

    # TODO: get a user
    def user
      true
    end
  end
end
