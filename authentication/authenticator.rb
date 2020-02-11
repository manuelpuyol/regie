# frozen_string_literal: true

require_relative 'current_user_singleton'
require_relative 'user'

module Authentication
  class Authenticator
    def initialize(email:, password:)
      @email = email
      @password = password
    end

    def call
      CurrentUserSingleton.instance.set(user) if password_match?
    end

    private

    def password_match?
      !user.nil? && user.password == @password
    end

    def user
      @user ||= User.where(email: @email).first
    end
  end
end
