# frozen_string_literal: true

require './grading/professor'

RSpec.describe Grading::Professor do
  it_behaves_like 'a DB record', 'users'

  describe '#courses' do
    let(:professor) { described_class.new }
    let(:course) { Registration::Course.new }
    let(:course_section) { Registration::CourseSection.new }

    subject { professor.courses }

    before do
      allow(professor).to receive(:course_sections).and_return([course_section])
      allow(course_section).to receive(:course).and_return(course)
    end

    it 'returns the professor courses' do
      expect(subject).to contain_exactly(course)
    end
  end
end
