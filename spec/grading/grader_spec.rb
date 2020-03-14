# frozen_string_literal: true

require './grading/grader'

RSpec.describe Grading::Grader do
  describe '#call' do
    let(:student_section) { create(:student_section, grade: old_grade) }
    let(:old_grade) { 'F' }
    let(:grade) { 'A' }
    let(:creator) { described_class.new(student_section_id: student_section_id, grade: grade) }

    subject { creator.call }

    context 'student section id does not exist' do
      let(:student_section_id) { 123 }

      it 'raises a DB::Errors::RecordNotFound error' do
        expect { subject }.to raise_error(DB::Errors::RecordNotFound)
      end
    end

    context 'when grade provided is not valid' do
      let(:student_section_id) { student_section.id }
      let(:grade) { 'K' }

      it 'raises a DB::Errors::InvalidRecordParameters error' do
        expect { subject }.to raise_error(DB::Errors::InvalidRecordParameters)
      end
    end

    context 'when parameters are valid' do
      let(:student_section_id) { student_section.id }
      let(:grade) { 'A' }

      it 'updates the student grade' do
        expect { subject }.to change { student_section.reload.grade }.from(old_grade).to(grade)
      end
    end
  end
end
