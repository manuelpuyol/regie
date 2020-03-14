# frozen_string_literal: true

require './grading/professor'
require './grading/current_professor_singleton'

RSpec.shared_context 'mock a professor' do
  let(:_mock_professor) { Grading::Professor.new(mock_professor.to_h) || spy(Grading::Professor, name: 'mock') }

  before do
    allow(Grading::CurrentProfessorSingleton).to receive_message_chain(:instance, :get).and_return(_mock_professor)
  end
end
