# frozen_string_literal: true

require './registration/course_enroller'

RSpec.describe Registration::CourseEnroller do
  let(:mock_student) { create(:user, :student) }
  let(:course_section) { create(:course_section) }

  include_context 'mock a student'

  describe '#call' do
    subject { described_class.new(course_section_id: course_section.id).call }

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

    context 'when student is already enrolled' do
      let(:course_list) { [] }
      let!(:student_section) { create(:student_section, student_id: mock_student.id, section_id: course_section.id) }

      before do
        allow(Registration::PrerequisitesChecker).to receive_message_chain(:new, :call).and_return(true)
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

      it 'creates a new StudentSection' do
        result = subject

        expect(subject.id).to_not be_nil
        expect(subject.student_id).to eq(mock_student.id)
        expect(subject.section_id).to eq(course_section.id)
      end
    end
  end
end
