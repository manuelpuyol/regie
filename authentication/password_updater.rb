# frozen_string_literal: true

require './db/errors/record_not_found'
require_relative 'user'

module Authentication
  class PasswordUpdater
    def initialize(email:, old_password:, new_password:)
      @email = email
      @old_password = old_password
      @new_password = new_password
    end

    def call
      update if valid?
    end

    private

    def update
      user.update(password: @new_password)
    end

    def valid?
      raise DB::Errors::RecordNotFound, 'User not found' if user.nil?

      true
    end

    def user
      @user ||= User.where(email: @email, password: @old_password).first
    end
  end
end
