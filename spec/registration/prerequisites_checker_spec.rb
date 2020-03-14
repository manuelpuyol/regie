# frozen_string_literal: true

require './registration/prerequisites_checker'

RSpec.describe Registration::PrerequisitesChecker do
  let(:mock_student) { create(:user, :student) }
  let(:course) { create(:course) }
  let(:quarter) { create(:quarter) }
  let(:prereq_course) { create(:course) }
  let(:prereq_section) { create(:course_section, quarter_id: quarter.id, course_id: prereq_course.id) }

  subject { described_class.new(course: course).call }

  include_context 'mock a student'

  describe '#call' do
    context 'when student attended all prerequisites' do
      let!(:prerequisite) { create(:prerequisite, course_id: course.id, prerequisite_id: prereq_course.id) }
      let!(:student_section) { create(:student_section, quarter: quarter, section_id: prereq_section.id, grade: grade, student_id: mock_student.id) }

      context 'whem student hasnt failed any' do
        let(:grade) { 'A' }

        it 'should return true' do
          expect(subject).to be true
        end
      end

      context 'whem student failed some' do
        let(:grade) { 'F' }

        it 'should return false' do
          expect(subject).to be false
        end
      end
    end

    context 'when course does not have any prerequisites' do
      it 'should return true' do
        expect(subject).to be true
      end
    end

    context 'when student is missing a prerequisite' do
      let!(:prerequisite) { create(:prerequisite, course_id: course.id, prerequisite_id: prereq_course.id) }

      it 'should return false' do
        expect(subject).to be false
      end
    end
  end
end
