# frozen_string_literal: true

require './registration/presenters/grade_history'

RSpec.describe Registration::Presenters::GradeHistory do
  describe '#call' do
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

    subject { described_class.new.call }

    it 'calls GradePresenter with the correct parameters' do
      student_sections[0..1].each do |student_section|
        expect(Registration::Presenters::Grade).to receive(:new).with(student_section).and_call_original
      end

      subject
    end
  end
end
