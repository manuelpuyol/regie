# frozen_string_literal: true

require './registration/student'

RSpec.describe Registration::Student do
  it_behaves_like 'a DB record', 'users'

  describe '#courses' do
    let(:student) { described_class.new }
    let(:course) { Registration::Course.new }
    let(:student_course) { Registration::StudentCourse.new }

    subject { student.courses }

    before do
      allow(student).to receive(:student_courses).and_return([student_course])
      allow(student_course).to receive(:course).and_return(course)
    end

    it 'returns the student courses' do
      expect(subject).to contain_exactly(course)
    end
  end
end
