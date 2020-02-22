# frozen_string_literal: true

require './registration/fetchers/available_courses'

RSpec.describe Registration::Fetchers::AvailableCourses do
  let!(:courses) { create_list(:course, 3) }

  describe '#call' do
    subject { described_class.new.call }

    it 'returns the list of current courses from a user' do
      expect(subject).to eq(courses)
    end
  end
end
