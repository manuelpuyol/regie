# frozen_string_literal: true

require './registration/course'

RSpec.describe Registration::Course do
  describe '#new' do
    let(:course_name) { 'mock name' }
    subject { described_class.new(name: course_name) }

    it 'sets the course name as course_name' do
      expect(subject.name).to eq(course_name)
    end
  end

  describe '#name=' do
    let(:old_name) { 'old name' }
    let(:new_name) { 'new name' }

    it 'changes the course name' do
      course = described_class.new(name: old_name) 
      course.name = new_name

      expect(course.name).to eq(new_name)
    end
  end
end
