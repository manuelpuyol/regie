# frozen_string_literal: true

require './registration/presenters/courses'
require './registration/course'

RSpec.describe Registration::Presenters::Courses do
  describe '#courses' do
    subject { described_class.new.send(:courses) }

    it 'raises a NotImplementedError' do
      expect { subject }.to raise_error(NotImplementedError)
    end
  end

  describe 'when inherited' do
    let(:dummy_class) do
      Class.new(Registration::Presenters::Courses) do
        def courses
          @courses ||= [
            Registration::Course.new(code: 'MPCS 2', name: '2'),
            Registration::Course.new(code: 'MPCS 1', name: '1'),
            Registration::Course.new(code: 'MPCS 3', name: '3')
          ]
        end
      end
    end

    describe '#call' do
      let(:dummy_instance) { dummy_class.new }
      subject { dummy_instance.call }

      it 'calls CoursePresenter with the correct parameters' do
        dummy_instance.courses.sort_by(&:code).each do |course|
          expect(Registration::Presenters::Course).to receive(:new).with(course).and_call_original
        end

        subject
      end

      it 'sorts the courses by code' do
        expect(subject).to eq(['MPCS 1 - 1', 'MPCS 2 - 2', 'MPCS 3 - 3'])
      end
    end
  end
end
