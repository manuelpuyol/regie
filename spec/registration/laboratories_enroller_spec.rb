# frozen_string_literal: true

require './registration/laboratories_enroller'

RSpec.describe Registration::LaboratoriesEnroller do
  let(:mock_course) { instance_double('Course') }

  describe '#call' do
    let(:laboratories) { [instance_double('Laboratory'), instance_double('Laboratory'), instance_double('Laboratory')] }
    subject { described_class.new(course: mock_course).call }

    before do
      allow_any_instance_of(Registration::Fetchers::CourseLaboratories).to receive(:call).and_return(laboratories)
    end

    xit 'calls LaboratoryEnroller for each of the laboratories courses' do
      laboratories.each do |lab|
        expect(Registration::LaboratoryEnroller).to receive(:new).with(laboratory: lab).and_call_original
      end
      expect_any_instance_of(Registration::LaboratoryEnroller).to receive(:call).exactly(laboratories.size).times.and_call_original

      subject
    end
  end
end
