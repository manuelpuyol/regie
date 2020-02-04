# frozen_string_literal: true

require './registration/course_laboratories_fetcher'

RSpec.describe Registration::CourseLaboratoriesFetcher do
  let(:mock_course) { instance_double('Course') }

  describe '#new' do
    subject { described_class.new(course: mock_course) }

    it 'sets @course as the singleton current user' do
      expect(subject.instance_variable_get('@course')).to eq(mock_course)
    end
  end

  describe '#call' do
    let(:laboratories) { [instance_double('Laboratory'), instance_double('Laboratory'), instance_double('Laboratory')] }
    subject { described_class.new(course: mock_course).call }

    it 'returns the list laboratories from a course' do
      expect(subject).to eq(laboratories)
    end
  end
end
