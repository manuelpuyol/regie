# frozen_string_literal: true

require './registration/student_section'

RSpec.describe Registration::StudentSection do
  it_behaves_like 'a DB record', 'student_sections'
end
