# frozen_string_literal: true

require './grading/current_professor'

RSpec.describe Grading::CurrentProfessor do
  include_context 'mock a user'

  describe '#new' do
    subject { described_class.new }

    it 'casts the user as a professor' do
      expect(subject.instance_variable_get('@professor')).to be_a(Grading::Professor)
    end
  end
end
