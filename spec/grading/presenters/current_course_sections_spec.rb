# frozen_string_literal: true

require './grading/presenters/current_course_sections'

RSpec.describe Grading::Presenters::CurrentCourseSections do
  describe '#call' do
    let(:quarter) { create(:quarter) }
    let(:mock_sections) { create_list(:course_section, 3, quarter_id: quarter.id) }

    subject { described_class.new.call }

    before do
      allow_any_instance_of(Grading::Fetchers::CurrentCourseSections).to receive(:call).and_return(mock_sections)
    end

    it 'calls the CurrentCourseSections fetcher and presents the returned sections' do
      expect(Grading::Presenters::CourseSections).to receive(:new).with(mock_sections).and_call_original

      subject
    end
  end
end
