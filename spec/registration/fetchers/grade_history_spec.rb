# frozen_string_literal: true

require './registration/student'
require './registration/fetchers/grade_history'

RSpec.describe Registration::Fetchers::GradeHistory do
  let(:mock_student) { Registration::Student.new(create(:user, :student).to_h) }
  let(:quarter) { create(:quarter) }
  let!(:student_sections) do
    [
      create(:student_section, quarter: quarter, student_id: mock_student.id),
      create(:student_section, quarter: quarter, student_id: mock_student.id),
      create(:student_section, quarter: quarter, student_id: mock_student.id, grade: nil)
    ]
  end

  include_context 'mock a student'

  describe '#call' do
    subject { described_class.new.call }

    it 'returns the list of student_sections that have a grade' do
      expect(subject).to match_array(student_sections[0..1])
    end
  end
end
