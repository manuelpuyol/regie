# frozen_string_literal: true

require './registration/current_student'

RSpec.describe Registration::CurrentStudent do
  include_context 'mock a user'

  describe '#new' do
    subject { described_class.new }

    it 'casts the user as a student' do
      expect(subject.instance_variable_get('@student')).to be_a(Registration::Student)
    end
  end
end
