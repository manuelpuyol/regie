# frozen_string_literal: true

require './registration/student'
require './registration/current_student_singleton'

RSpec.shared_context 'mock a student' do
  let(:_mock_student) { mock_student || spy(Registration::Student, name: 'mock') }

  before do
    allow(Registration::CurrentStudentSingleton).to receive_message_chain(:instance, :get).and_return(_mock_student)
  end
end
