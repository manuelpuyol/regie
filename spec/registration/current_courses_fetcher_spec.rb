# frozen_string_literal: true

require './registration/current_courses_fetcher'

RSpec.describe Registration::CurrentCoursesFetcher do
  describe '#new' do
    let(:mock_user) { instance_double('User') }
    subject { described_class.new }

    before do
      allow(Authentication::CurrentUserSingleton).to receive_message_chain(:instance, :get).and_return(mock_user)
    end

    it 'sets @user as the singleton current user' do
      expect(subject.instance_variable_get('@user')).to eq(mock_user)
    end
  end

  describe '#call' do
    let(:courses) { [instance_double('Course'), instance_double('Course'), instance_double('Course')] }
    subject { described_class.new.call }


    it 'returns the list of current courses from a user' do
      expect(subject).to eq(courses)
    end
  end
end
