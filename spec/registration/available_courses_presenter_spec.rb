# frozen_string_literal: true

require './registration/available_courses_presenter'

RSpec.describe Registration::AvailableCoursesPresenter do
  describe '#call' do
    let(:mock_courses) do
      [
        instance_double('Course', code: 'MPCS 2', name: '2'),
        instance_double('Course', code: 'MPCS 1', name: '1'),
        instance_double('Course', code: 'MPCS 3', name: '3')
      ]
    end
    subject { described_class.new.call }

    before do
      allow(Registration::AvailableCoursesFetcher).to receive_message_chain(:new, :call).and_return(mock_courses)
    end

    it 'calls CoursePresenter with the correct parameters' do
      mock_courses.each do |course|
        expect(Registration::CoursePresenter).to receive(:new).with(course).and_call_original
      end

      subject
    end

    it 'sorts the courses by code' do
      expect(subject).to eq(['MPCS 1 - 1', 'MPCS 2 - 2', 'MPCS 3 - 3'])
    end
  end
end
