# frozen_string_literal: true

require './registration/presenters/current_courses_presenter'

RSpec.describe Registration::Presenters::CurrentCoursesPresenter do
  describe '#call' do
    let(:mock_courses) do
      [
        instance_double('Course', code: 'MPCS 1', name: '1'),
        instance_double('Course', code: 'MPCS 2', name: '2'),
        instance_double('Course', code: 'MPCS 3', name: '3')
      ]
    end
    subject { described_class.new.call }

    before do
      allow(Registration::Fetchers::CurrentCoursesFetcher).to receive_message_chain(:new, :call).and_return(mock_courses)
    end

    it 'calls CoursePresenter with the correct parameters' do
      mock_courses.each do |course|
        expect(Registration::Presenters::CoursePresenter).to receive(:new).with(course).and_call_original
      end

      subject
    end
  end
end
