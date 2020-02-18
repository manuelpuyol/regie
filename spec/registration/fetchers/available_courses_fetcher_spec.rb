# frozen_string_literal: true

require './registration/fetchers/available_courses_fetcher'

RSpec.describe Registration::Fetchers::AvailableCoursesFetcher do
  let(:courses) { [instance_double('Course'), instance_double('Course'), instance_double('Course')] }

  before do
    allow(Registration::Course).to receive(:all).and_return(courses)
  end

  describe '#call' do
    subject { described_class.new.call }

    it 'returns the list of current courses from a user' do
      expect(subject).to eq(courses)
    end
  end
end
