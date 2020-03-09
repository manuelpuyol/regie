# frozen_string_literal: true

require './registration/presenters/courses_by_name'

RSpec.describe Registration::Presenters::CoursesByName do
  describe '#call' do
    let(:query) { 'search' }
    let(:courses) do
      [
        create(:course, name: 'Name to search', code: 'Mock'),
        create(:course),
        create(:course)
      ]
    end

    subject { described_class.new(query: query).call }

    before do
      allow_any_instance_of(Registration::Fetchers::AvailableCourses).to receive(:call).and_return(courses)
    end

    it 'calls Course with the correct parameters' do
      expect(Registration::Presenters::Course).to receive(:new).with(courses.first).and_call_original

      subject
    end
  end
end
