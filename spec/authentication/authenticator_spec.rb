# frozen_string_literal: true

require './authentication/authenticator'

RSpec.describe Authentication::Authenticator do
  describe '#call' do
    let(:email) { 'email' }
    let(:password) { 'password' }
    let(:authenticator) { Authentication::Authenticator.new(email: email, password: password) }

    subject { authenticator.call }

    context 'when passwords match' do
      let(:mock_user) { instance_double('User') }

      before do
        allow(authenticator).to receive(:user).and_return(mock_user)
        allow(authenticator).to receive(:password_match?).and_return(true)
      end

      it 'returns the user' do
        expect(subject).to eq(mock_user)
      end
    end

    context 'when passwords do not match' do
      before do
        allow(authenticator).to receive(:password_match?).and_return(false)
      end

      it 'returns nil' do
        expect(subject).to be_nil
      end
    end
  end
end
