# frozen_string_literal: true

require './registration/presenters/available_quarters'

RSpec.describe Registration::Presenters::AvailableQuarters do
  describe '#call' do
    let(:current_quarter) { create(:quarter, active: true, year: 2020) }
    let(:old_quarter) { create(:quarter, active: false, year: 2019) }
    let(:quarters) { [old_quarter, current_quarter] }
    subject { described_class.new.call }

    before do
      allow_any_instance_of(Registration::Fetchers::AvailableQuarters).to receive(:call).and_return(quarters)
    end

    it 'calls Quarter with the correct parameters' do
      quarters.each do |quarter|
        expect(Registration::Presenters::Quarter).to receive(:new).with(quarter).and_call_original
      end

      subject
    end
  end
end
