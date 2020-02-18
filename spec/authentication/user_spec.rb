# frozen_string_literal: true

require './authentication/user'

RSpec.describe Authentication::User do
  it_behaves_like 'a DB record', 'users'
end
