# frozen_string_literal: true

require './registration/fetchers/course_laboratories'

RSpec.describe Registration::Fetchers::CourseLaboratories do
  let(:mock_course) { instance_double('Course') }

  describe '#call' do
    let(:laboratories) { [instance_double('Laboratory'), instance_double('Laboratory'), instance_double('Laboratory')] }
    subject { described_class.new(course: mock_course).call }

    it 'returns the list laboratories from a course' do
      expect(subject).to eq(laboratories)
    end
  end
end
