# frozen_string_literal: true

require './registration/fetchers/available_quarters'

RSpec.describe Registration::Fetchers::AvailableQuarters do
  let!(:current_quarter) { create(:quarter, active: true, year: 2020) }
  let!(:old_quarter) { create(:quarter, active: false, year: 2019) }

  describe '#call' do
    subject { described_class.new.call }

    it 'returns ALL quarters' do
      expect(subject).to match_array([current_quarter, old_quarter])
    end
  end
end
