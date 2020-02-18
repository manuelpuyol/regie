# frozen_string_literal: true

require './registration/course'

RSpec.describe Registration::Course do
  it_behaves_like 'a DB record', 'courses'
end
