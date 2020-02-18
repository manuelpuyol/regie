# frozen_string_literal: true

require './registration/current_courses_fetcher'

RSpec.describe Registration::CurrentCoursesFetcher do
  let(:mock_student) { instance_double('Student', courses: courses) }
  let(:courses) { [instance_double('Course'), instance_double('Course'), instance_double('Course')] }

  include_context 'mock a student'

  describe '#new' do
    subject { described_class.new }

    it 'sets @student as the singleton current user' do
      expect(subject.instance_variable_get('@student')).to eq(mock_student)
    end
  end

  describe '#call' do
    subject { described_class.new.call }

    it 'returns the list of current courses from a user' do
      expect(subject).to eq(courses)
    end
  end
end
