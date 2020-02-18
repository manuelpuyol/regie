# frozen_string_literal: true

require './registration/course_presenter'

RSpec.describe Registration::CoursePresenter do
  describe '#call' do
    let(:mock_course) { instance_double('Course', code: 'MPCS 1', name: '1') }
    subject { described_class.new(mock_course).call }

    it 'returns a list of the courses names' do
      expect(subject).to eq('MPCS 1 - 1')
    end
  end
end
