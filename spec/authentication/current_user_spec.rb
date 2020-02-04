# frozen_string_literal: true

require './authentication/current_user'

RSpec.describe Authentication::CurrentUser do
  describe '#get' do
    let(:current_user) { Authentication::CurrentUser.new }
    subject { current_user.get }

    context 'when no user has been set' do
      it 'returns nil' do
        expect(subject).to be_nil
      end
    end

    context 'when a user has been set' do
      let(:mock_user) { instance_double('User') }
      let(:current_user) { Authentication::CurrentUser.new }

      before do
        current_user.set(mock_user)
      end

      it 'returns nil' do
        expect(subject).to eq(mock_user)
      end
    end
  end
end
