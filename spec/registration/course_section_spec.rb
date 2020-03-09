# frozen_string_literal: true

require './registration/course_section'

RSpec.describe Registration::CourseSection do
  it_behaves_like 'a DB record', 'course_sections'
end
