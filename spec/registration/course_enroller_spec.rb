# frozen_string_literal: true

require './registration/course_enroller'

RSpec.describe Registration::CourseEnroller do
  let(:mock_student) { create(:user, :student) }
  let(:course_section) { create(:course_section) }
  let(:course) { course_section.course }

  include_context 'mock a student'

  describe '#call' do
    subject { described_class.new(course: course).call }

    before do
      allow(Registration::Fetchers::CurrentCourses).to receive_message_chain(:new, :call).and_return(course_list)
    end

    context 'when course is not available' do
      let(:course) { create(:course) }
      let(:course_list) { [] }

      it 'raises Registration::Errors::CourseNotAvailable' do
        expect { subject }.to raise_error(Registration::Errors::CourseNotAvailable)
      end
    end

    context 'when user has 3 or more courses' do
      let(:course_list) { [instance_double('Course'), instance_double('Course'), instance_double('Course'), instance_double('Course')] }

      it 'raises Registration::Errors::ExceededRegistrationMax' do
        expect { subject }.to raise_error(Registration::Errors::ExceededRegistrationMax)
      end
    end

    context 'when prerequisites arent met' do
      let(:course_list) { [] }

      before do
        allow(Registration::PrerequisitesChecker).to receive_message_chain(:new, :call).and_return(false)
      end

      it 'raises Registration::Errors::MissingPrerequisites' do
        expect { subject }.to raise_error(Registration::Errors::MissingPrerequisites)
      end
    end

    context 'when student is already enrolled' do
      let(:course_list) { [] }
      let!(:student_section) { create(:student_section, student_id: mock_student.id, section_id: course_section.id) }

      before do
        allow(Registration::PrerequisitesChecker).to receive_message_chain(:new, :call).and_return(true)
      end

      it 'raises Registration::Errors::AlreadyEnrolled' do
        expect { subject }.to raise_error(Registration::Errors::AlreadyEnrolled)
      end
    end

    context 'when student can enroll' do
      let(:course_list) { [] }

      before do
        allow(Registration::PrerequisitesChecker).to receive_message_chain(:new, :call).and_return(true)
      end

      it 'creates a new StudentSection' do
        expect(subject.id).to_not be_nil
        expect(subject.student_id).to eq(mock_student.id)
        expect(subject.section_id).to eq(course_section.id)
      end
    end
  end
end
