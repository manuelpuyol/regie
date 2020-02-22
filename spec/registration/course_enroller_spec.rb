# frozen_string_literal: true

require './registration/course_enroller'

RSpec.describe Registration::CourseEnroller do
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
    subject { described_class.new(course: mock_course).call }

    before do
      allow(Registration::Fetchers::CurrentCourses).to receive_message_chain(:new, :call).and_return(course_list)
    end

    context 'when user has 3 or more courses' do
      let(:course_list) { [instance_double('Course'), instance_double('Course'), instance_double('Course'), instance_double('Course')] }

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end

    context 'when prerequisites arent met' do
      let(:course_list) { [] }

      before do
        allow(Registration::PrerequisitesChecker).to receive_message_chain(:new, :call).and_return(false)
      end

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end

    context 'when student can enroll' do
      let(:course_list) { [] }

      before do
        allow(Registration::PrerequisitesChecker).to receive_message_chain(:new, :call).and_return(true)
      end

      it 'enrolls the student in the course' do
        expect(subject).to eq(true)
      end
    end
  end
end
