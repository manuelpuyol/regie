# frozen_string_literal: true

require './grading/teacher'

RSpec.describe Grading::Teacher do
  it_behaves_like 'a DB record', 'users'

  describe '#courses' do
    let(:teacher) { described_class.new }
    let(:course) { Registration::Course.new }
    let(:course_section) { Registration::CourseSection.new }

    subject { teacher.courses }

    before do
      allow(teacher).to receive(:course_sections).and_return([course_section])
      allow(course_section).to receive(:course).and_return(course)
    end

    it 'returns the teacher courses' do
      expect(subject).to contain_exactly(course)
    end
  end
end
