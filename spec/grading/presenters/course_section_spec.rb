# frozen_string_literal: true

require './grading/presenters/course_section'

RSpec.describe Grading::Presenters::CourseSection do
  describe '#call' do
    let(:mock_section) { instance_double('CourseSection') }
    let(:mock_course) { instance_double('Course', code: 'code', name: 'name') }
    let(:mock_students) { [instance_double('Student', name: 'name', email: 'email'), instance_double('Student', name: 'name', email: 'email')] }

    subject { described_class.new(mock_section).call }

    before do
      allow(mock_section).to receive(:course).and_return(mock_course)
      allow(mock_section).to receive(:students).and_return(mock_students)
    end

    it 'calls the course and students presenters' do
      expect(Registration::Presenters::Course).to receive(:new).with(mock_course).and_call_original
      expect(Grading::Presenters::Students).to receive(:new).with(mock_students).and_call_original

      subject
    end
  end
end
