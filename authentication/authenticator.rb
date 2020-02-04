# frozen_string_literal: true

module Authentication
  class Authenticator
    def initialize(username, password)
      @username = username
      @password = password
    end

    # TODO: actually check password
    def password_match?
      true
    end
  end
end
