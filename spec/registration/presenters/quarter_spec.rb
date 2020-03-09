# frozen_string_literal: true

require './registration/presenters/quarter'

RSpec.describe Registration::Presenters::Quarter do
  describe '#call' do
    let(:quarter) { create(:quarter) }
    subject { described_class.new(quarter).call }

    it 'calls QuarterString with the correct params' do
      expect(Registration::Presenters::QuarterString).to receive(:new).with("#{quarter.year} - #{quarter.code}").and_call_original

      subject
    end
  end
end
