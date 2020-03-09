# frozen_string_literal: true

require './registration/quarter'

module Administration
  class QuarterCreator
    def initialize(year:, code:)
      @quarter = Registration::Quarter.new(
        year: year.to_i,
        code: code.to_i
      )
    end

    def call
      @quarter.save!
      @quarter
    end
  end
end
