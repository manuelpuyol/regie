# frozen_string_literal: true

require './registration/laboratory'

RSpec.describe Registration::Laboratory do
  describe '#new' do
    let(:laboratory_name) { 'mock name' }
    subject { described_class.new(name: laboratory_name) }

    it 'sets the laboratory name as laboratory_name' do
      expect(subject.name).to eq(laboratory_name)
    end
  end

  describe '#name=' do
    let(:old_name) { 'old name' }
    let(:new_name) { 'new name' }

    it 'changes the laboratory name' do
      laboratory = described_class.new(name: old_name) 
      laboratory.name = new_name

      expect(laboratory.name).to eq(new_name)
    end
  end
end
