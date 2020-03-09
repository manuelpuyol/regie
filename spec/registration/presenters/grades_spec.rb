# frozen_string_literal: true

require './registration/presenters/grades'
require './registration/student_section'

RSpec.describe Registration::Presenters::Grades do
  describe '#student_sections' do
    subject { described_class.new.send(:student_sections) }

    it 'raises a NotImplementedError' do
      expect { subject }.to raise_error(NotImplementedError)
    end
  end

  describe 'when inherited' do
    let(:dummy_class) do
      Class.new(described_class) do
        def student_sections
          @student_sections ||= [
            Registration::StudentSection.new,
            Registration::StudentSection.new,
            Registration::StudentSection.new
          ]
        end
      end
    end

    describe '#call' do
      let(:dummy_instance) { dummy_class.new }
      let(:mock_grade_presenter) { spy(Registration::Presenters::Grade) }
      subject { dummy_instance.call }

      it 'calls GradePresenter with the correct parameters' do
        dummy_instance.student_sections.each do |grade|
          expect(Registration::Presenters::Grade).to receive(:new).with(grade).and_return(mock_grade_presenter)
        end

        subject
      end
    end
  end
end
