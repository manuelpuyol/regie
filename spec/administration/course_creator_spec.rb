# frozen_string_literal: true

require './administration/course_creator'

RSpec.describe Administration::CourseCreator do
  describe '#call' do
    let(:name) { 'name' }
    let(:code) { 'code' }
    let(:creatoe) { described_class.new(name: name, code: code) }

    subject { creatoe.call }

    it 'creates a course' do
      course = subject

      expect(course.id).to_not be_nil
      expect(course.name).to eq(name)
      expect(course.code).to eq(code)
    end
  end
end
