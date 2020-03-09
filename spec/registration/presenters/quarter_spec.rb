# frozen_string_literal: true

require './registration/presenters/quarter'

RSpec.describe Registration::Presenters::Quarter do
  describe '#call' do
    let(:mock_quarter) { '2020 - 1' }
    subject { described_class.new(mock_quarter).call }

    it 'formats the quarter code' do
      expect(subject).to eq('2020 - Winter')
    end
  end
end
