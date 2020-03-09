# frozen_string_literal: true

require './authentication/user'

module Administration
  class UserCreator
    def initialize(name:, email:, password:, type:)
      @user = Authentication::User.new(
        name: name,
        email: email,
        password: password,
        type: Authentication::User::TYPES[type]
      )
    end

    def call
      @user.save!
      @user
    end
  end
end
