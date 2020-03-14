# frozen_string_literal: true

require './registration/fetchers/current_courses'

RSpec.describe Registration::Fetchers::CurrentCourses do
  let(:mock_student) { create(:user, :student) }
  let(:current_quarter) { create(:quarter, active: true, year: 2020) }
  let(:old_quarter) { create(:quarter, active: false, year: 2019) }

  let(:old_course) { create(:course_section, quarter_id: old_quarter.id) }
  let(:current_course) { create(:course_section, quarter_id: current_quarter.id) }

  let!(:old_student_section) { create(:student_section, section_id: old_course.id, student_id: mock_student.id) }
  let!(:current_student_section) { create(:student_section, section_id: current_course.id, student_id: mock_student.id) }

  include_context 'mock a student'

  describe '#call' do
    subject { described_class.new.call }

    it 'returns the list of current courses from a user' do
      expect(subject).to match_array([current_course.course])
    end
  end
end
