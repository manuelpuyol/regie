# frozen_string_literal: true

require './registration/student'

RSpec.describe Registration::Student do
  it_behaves_like 'a DB record', 'users'

  describe '#courses' do
    let(:student) { described_class.new }
    let(:course) { Registration::Course.new }
    let(:student_section) { Registration::StudentSection.new }

    subject { student.courses }

    before do
      allow(student).to receive(:student_sections).and_return([student_section])
      allow(student_section).to receive(:course).and_return(course)
    end

    it 'returns the student courses' do
      expect(subject).to contain_exactly(course)
    end
  end
end
