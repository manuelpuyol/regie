# frozen_string_literal: true

require './authentication/password_updater'

RSpec.describe Authentication::PasswordUpdater do
  describe '#call' do
    let(:user) { create(:user, email: 'email', password: 'old pass') }
    let(:email) { 'email' }
    let(:old_password) { 'old pass' }
    let(:new_password) { 'new pass' }

    let(:creator) { described_class.new(old_password: old_password, email: email, new_password: new_password) }

    subject { creator.call }

    context 'when email is incorrect' do
      let(:email) { 'wrong email' }

      it 'raises a DB::Errors::RecordNotFound error' do
        expect { subject }.to raise_error(DB::Errors::RecordNotFound)
      end
    end

    context 'when password is incorrect' do
      let(:old_password) { 'wrong pass' }

      it 'raises a DB::Errors::RecordNotFound error' do
        expect { subject }.to raise_error(DB::Errors::RecordNotFound)
      end
    end

    context 'when email and password match' do
      it 'updates the user password' do
        expect { subject }.to change { user.reload.password }.from(old_password).to(new_password)
      end
    end
  end
end
