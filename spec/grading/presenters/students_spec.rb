# frozen_string_literal: true

require './grading/presenters/students'

RSpec.describe Grading::Presenters::Students do
  describe '#call' do
    let(:mock_students) { [instance_double('Student', name: '2', email: 'email'), instance_double('Student', name: '3', email: 'email'), instance_double('Student', name: '1', email: 'email')] }
    let(:sorted_students) { mock_students.sort_by(&:name) }
    subject { described_class.new(mock_students).call }

    it 'calls the student presenter for each student in sorted order' do
      sorted_students.each do |student|
        expect(Grading::Presenters::Student).to receive(:new).with(student).and_call_original
      end

      subject
    end
  end
end
