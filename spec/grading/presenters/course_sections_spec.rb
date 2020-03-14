# frozen_string_literal: true

require './grading/presenters/course_sections'

RSpec.describe Grading::Presenters::CourseSections do
  describe '#call' do
    let(:quarter) { create(:quarter) }
    let(:mock_sections) { create_list(:course_section, 3, quarter_id: quarter.id) }
    let(:sorted_sections) { mock_sections.sort_by { |x| x.course.code } }
    subject { described_class.new(mock_sections).call }

    it 'calls the CourseSection presenter for each section in sorted order' do
      sorted_sections.each do |section|
        expect(Grading::Presenters::CourseSection).to receive(:new).with(section).and_call_original
      end

      subject
    end
  end
end
