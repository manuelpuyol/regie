# frozen_string_literal: true

require './registration/current_quarter'

RSpec.describe Registration::CurrentQuarter do
  describe '#new' do
    subject { described_class.new }

    let!(:quarter_1) { create(:quarter, active: true, code: 1) }
    let!(:quarter_2) { create(:quarter, active: false, code: 2) }

    it 'finds the current quarter and sets it' do
      expect(subject.instance_variable_get('@quarter')).to eq(quarter_1)
    end
  end
end
