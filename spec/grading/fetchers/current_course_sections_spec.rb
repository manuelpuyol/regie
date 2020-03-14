# frozen_string_literal: true

require './grading/fetchers/current_course_sections'

RSpec.describe Grading::Fetchers::CurrentCourseSections do
  let(:mock_professor) { create(:user, :staff) }
  let(:current_quarter) { create(:quarter, active: true, year: 2020) }
  let(:old_quarter) { create(:quarter, active: false, year: 2019) }

  let!(:old_course) { create(:course_section, quarter_id: old_quarter.id, professor_id: mock_professor.id) }
  let!(:current_course) { create(:course_section, quarter_id: current_quarter.id, professor_id: mock_professor.id) }

  include_context 'mock a professor'

  describe '#call' do
    subject { described_class.new.call }

    it 'returns the list of current courses from a user' do
      expect(subject).to match_array([current_course])
    end
  end
end
