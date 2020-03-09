# frozen_string_literal: true

require './registration/fetchers/available_courses'

RSpec.describe Registration::Fetchers::AvailableCourses do
  let(:current_quarter) { create(:quarter, active: true, year: 2020) }
  let(:old_quarter) { create(:quarter, active: false, year: 2019) }

  let!(:old_courses) { create_list(:course_section, 2, quarter_id: old_quarter.id) }
  let!(:current_courses) { create_list(:course_section, 2, quarter_id: current_quarter.id) }

  describe '#call' do
    subject { described_class.new.call }

    it 'returns the list of courses in the current quarter' do
      expect(subject).to eq(current_courses.map(&:course))
    end
  end
end
