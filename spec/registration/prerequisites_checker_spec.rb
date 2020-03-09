# frozen_string_literal: true

require './registration/prerequisites_checker'

RSpec.describe Registration::PrerequisitesChecker do
  let(:mock_course) { instance_double('Course') }
  let(:mock_student) { instance_double('Student') }

  before do
    allow(Registration::CurrentStudentSingleton).to receive_message_chain(:instance, :get).and_return(mock_student)
  end

  describe '#call' do
    let(:courses) { [instance_double('Course'), instance_double('Course'), instance_double('Course')] }
    subject { described_class.new(course: mock_course).call }

    context 'when student completed all prerequisites' do
      xit 'should return true' do
        expect(subject).to be true
      end
    end

    context 'when student completed has a missing prerequisite' do
      xit 'should return false' do
        expect(subject).to be false
      end
    end
  end
end
