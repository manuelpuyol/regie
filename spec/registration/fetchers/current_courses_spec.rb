# frozen_string_literal: true

require './registration/fetchers/current_courses'

RSpec.describe Registration::Fetchers::CurrentCourses do
  let(:mock_student) { instance_double('Student', current_courses: courses) }
  let(:courses) { [instance_double('Course'), instance_double('Course'), instance_double('Course')] }

  include_context 'mock a student'

  describe '#call' do
    subject { described_class.new.call }

    it 'returns the list of current courses from a user' do
      expect(subject).to eq(courses)
    end
  end
end
