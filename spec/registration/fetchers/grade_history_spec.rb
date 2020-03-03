# frozen_string_literal: true

require './registration/student'
require './registration/fetchers/grade_history'

RSpec.describe Registration::Fetchers::GradeHistory do
  let(:mock_student) { Registration::Student.new(create(:user, :student).to_h) }
  let!(:student_courses) { [create(:student_course, student_id: mock_student.id), create(:student_course, student_id: mock_student.id), create(:student_course, student_id: mock_student.id, grade: nil)] }

  include_context 'mock a student'

  describe '#call' do
    subject { described_class.new.call }

    it 'returns the list of student_courses that have a grade' do
      expect(subject).to eq([student_courses[0], student_courses[1]])
    end
  end
end
