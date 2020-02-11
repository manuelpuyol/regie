# frozen_string_literal: true

require './registration/prerequisites_checker'

RSpec.describe Registration::PrerequisitesChecker do
  let(:mock_course) { instance_double('Course') }

  describe '#new' do
    let(:mock_student) { instance_double('Student') }
    subject { described_class.new(course: mock_course) }

    before do
      allow(Registration::CurrentStudent).to receive_message_chain(:instance, :get).and_return(mock_student)
    end

    it 'sets @student as the singleton current user' do
      expect(subject.instance_variable_get('@student')).to eq(mock_student)
    end
  end

  describe '#call' do
    let(:courses) { [instance_double('Course'), instance_double('Course'), instance_double('Course')] }
    subject { described_class.new(course: mock_course).call }

    context 'when student completed all prerequisites' do
      it 'should return true' do
        expect(subject).to be true
      end
    end

    context 'when student completed has a missing prerequisite' do
      it 'should return false' do
        expect(subject).to be false
      end
    end
  end
end
