# frozen_string_literal: true

require './administration/course_section_creator'

RSpec.describe Administration::CourseSectionCreator do
  describe '#call' do
    let(:course) { create(:course) }
    let(:quarter) { create(:quarter) }
    let(:creator) { described_class.new(course_id: course.id, quarter_id: quarter.id) }

    subject { creator.call }

    it 'creates a course_section' do
      course_section = subject

      expect(course_section.id).to_not be_nil
      expect(course_section.course_id).to eq(course.id)
      expect(course_section.quarter_id).to eq(quarter.id)
    end
  end
end
