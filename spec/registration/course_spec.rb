# frozen_string_literal: true

require './registration/course'

RSpec.describe Registration::Course do
  let(:table_name) { 'courses' }

  it_behaves_like 'a DB record', 'courses'
end
