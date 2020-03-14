# frozen_string_literal: true

require './administration/course_section_creator'

RSpec.describe Administration::CourseSectionCreator do
  describe '#call' do
    let(:course) { create(:course) }
    let(:quarter) { create(:quarter) }
    let(:creator) { described_class.new(course_id: course.id, quarter_id: quarter.id, professor_email: email) }

    subject { creator.call }

    context 'when email provided does not exist' do
      let(:email) { 'nonexistent@uchicago.edu' }

      it 'raises a DB::Errors::RecordNotFound error' do
        expect { subject }.to raise_error(DB::Errors::RecordNotFound)
      end
    end

    context 'when email provided exists' do
      let(:email) { user.email }

      context 'when email is not from a professor' do
        let(:user) { create(:user, :student) }

        it 'raises a DB::Errors::RecordNotFound error' do
          expect { subject }.to raise_error(DB::Errors::RecordNotFound)
        end
      end

      context 'when email is from a professor' do
        let(:user) { create(:user, :staff) }

        it 'creates a course_section' do
          course_section = subject

          expect(course_section.id).to_not be_nil
          expect(course_section.course_id).to eq(course.id)
          expect(course_section.quarter_id).to eq(quarter.id)
          expect(course_section.professor_id).to eq(user.id)
        end
      end
    end
  end
end
