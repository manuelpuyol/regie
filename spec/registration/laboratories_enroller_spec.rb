# frozen_string_literal: true

require './registration/laboratories_enroller'

RSpec.describe Registration::LaboratoriesEnroller do
  let(:mock_course) { instance_double('Course') }

  describe '#new' do
    let(:mock_student) { instance_double('Student') }
    subject { described_class.new(course: mock_course) }

    before do
      allow(Registration::CurrentStudentSingleton).to receive_message_chain(:instance, :get).and_return(mock_student)
    end

    it 'sets @student as the singleton current user' do
      expect(subject.instance_variable_get('@student')).to eq(mock_student)
    end

    it 'sets @course the receiver course' do
      expect(subject.instance_variable_get('@course')).to eq(mock_course)
    end
  end

  describe '#call' do
    let(:laboratories) { [instance_double('Laboratory'), instance_double('Laboratory'), instance_double('Laboratory')] }
    subject { described_class.new(course: mock_course).call }

    before do
      allow_any_instance_of(Registration::CourseLaboratoriesFetcher).to receive(:call).and_return(laboratories)
    end

    it 'calls LaboratoryEnroller for each of the laboratories courses' do
      laboratories.each do |lab|
        expect(Registration::LaboratoryEnroller).to receive(:new).with(laboratory: lab).and_call_original
      end
      expect_any_instance_of(Registration::LaboratoryEnroller).to receive(:call).exactly(laboratories.size).times.and_call_original

      subject
    end
  end
end
