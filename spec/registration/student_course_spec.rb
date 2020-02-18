# frozen_string_literal: true

require './registration/student_course'

RSpec.describe Registration::StudentCourse do
  it_behaves_like 'a DB record', 'student_courses'
end
