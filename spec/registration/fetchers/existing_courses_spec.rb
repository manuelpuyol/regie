# frozen_string_literal: true

require './registration/fetchers/existing_courses'

RSpec.describe Registration::Fetchers::ExistingCourses do
  let(:current_quarter) { create(:quarter, active: true, year: 2020) }
  let(:old_quarter) { create(:quarter, active: false, year: 2019) }

  let!(:old_courses) { create_list(:course_section, 2, quarter_id: old_quarter.id) }
  let!(:current_courses) { create_list(:course_section, 2, quarter_id: current_quarter.id) }

  describe '#call' do
    subject { described_class.new.call }

    it 'returns ALL courses' do
      expect(subject).to match_array(old_courses.map(&:course) + current_courses.map(&:course))
    end
  end
end
