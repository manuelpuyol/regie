# frozen_string_literal: true

require './registration/prerequisite'

RSpec.describe Registration::Prerequisite do
  it_behaves_like 'a DB record', 'prerequisites'
end
