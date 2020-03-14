# frozen_string_literal: true

require './grading/presenters/student'

RSpec.describe Grading::Presenters::Student do
  describe '#call' do
    let(:mock_student) { instance_double('Student', name: 'Name', email: 'Email') }
    subject { described_class.new(mock_student).call }

    it 'returns the student information' do
      expect(subject).to eq('Name - Email')
    end
  end
end
