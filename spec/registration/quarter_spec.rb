# frozen_string_literal: true

require './registration/quarter'

RSpec.describe Registration::Quarter do
  it_behaves_like 'a DB record', 'quarters'
end
