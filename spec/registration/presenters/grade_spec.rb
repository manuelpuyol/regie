# frozen_string_literal: true

require './registration/presenters/grade'

RSpec.describe Registration::Presenters::Grade do
  describe '#call' do
    let(:mock_course) { instance_double('Course', code: 'MPCS 1', name: '1') }
    let(:mock_student_course) { instance_double('StudentCourse', grade: 'B', course: mock_course) }
    subject { described_class.new(mock_student_course).call }

    it 'returns a list of the courses names' do
      expect(subject).to eq('MPCS 1 - 1 => B')
    end
  end
end
