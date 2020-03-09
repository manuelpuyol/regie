# frozen_string_literal: true

require './administration/quarter_creator'

RSpec.describe Administration::QuarterCreator do
  describe '#call' do
    let(:year) { 2020 }
    let(:code) { 1 }
    let(:creator) { described_class.new(year: year, code: code) }

    subject { creator.call }

    it 'creates a quarter' do
      quarter = subject

      expect(quarter.id).to_not be_nil
      expect(quarter.year).to eq(year)
      expect(quarter.code).to eq(code)
    end
  end
end
