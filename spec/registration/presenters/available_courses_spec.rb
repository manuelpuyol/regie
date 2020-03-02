# frozen_string_literal: true

require './registration/presenters/available_courses'

RSpec.describe Registration::Presenters::AvailableCourses do
  describe '#call' do
    let!(:courses) { create_list(:course, 3) }
    subject { described_class.new.call }

    it 'calls Course with the correct parameters' do
      courses.each do |course|
        expect(Registration::Presenters::Course).to receive(:new).with(course).and_call_original
      end

      subject
    end
  end
end
