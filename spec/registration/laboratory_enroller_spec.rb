# frozen_string_literal: true

require './registration/laboratory_enroller'

RSpec.describe Registration::LaboratoryEnroller do
  let(:mock_laboratory) { instance_double('Laboratory') }
  let(:mock_student) { instance_double('Student') }

  before do
    allow(Registration::CurrentStudentSingleton).to receive_message_chain(:instance, :get).and_return(mock_student)
  end

  describe '#new' do
    subject { described_class.new(laboratory: mock_laboratory) }

    it 'sets @student as the singleton current user' do
      expect(subject.instance_variable_get('@student')).to eq(mock_student)
    end

    it 'sets @laboratory the receiver laboratory' do
      expect(subject.instance_variable_get('@laboratory')).to eq(mock_laboratory)
    end
  end

  describe '#call' do
    subject { described_class.new(laboratory: mock_laboratory).call }

    it 'enrolles the current student in a laboratory' do
      expect(subject).to be true
    end
  end
end
