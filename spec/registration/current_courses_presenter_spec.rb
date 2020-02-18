# frozen_string_literal: true

require './registration/current_courses_presenter'

RSpec.describe Registration::CurrentCoursesPresenter do
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
      allow(Registration::CurrentCoursesFetcher).to receive_message_chain(:new, :call).and_return(mock_courses)
    end

    it 'returns a list of the courses names' do
      expect(subject).to contain_exactly('MPCS 1 - 1', 'MPCS 2 - 2', 'MPCS 3 - 3')
    end
  end
end
