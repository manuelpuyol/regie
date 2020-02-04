# frozen_string_literal: true

require_relative 'current_user'

module Authentication
  class Authenticator
    def initialize(username, password)
      @username = username
      @password = password
    end

    def authenticate
      CurrentUser.instance.set(user) if password_match?
    end

    # TODO: actually check password
    def password_match?
      true
    end

    private

    # TODO: get a user
    def user
      true
    end
  end
end
