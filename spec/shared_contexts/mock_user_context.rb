# frozen_string_literal: true

require './authentication/user'
require './authentication/current_user_singleton'

RSpec.shared_context 'mock a user' do
  let(:_mock_user) { (defined?(mock_user) && mock_user) || spy(Authentication::User, name: 'mock') }

  before do
    allow(Authentication::CurrentUserSingleton).to receive_message_chain(:instance, :get).and_return(_mock_user)
  end
end
