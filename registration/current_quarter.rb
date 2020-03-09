# frozen_string_literal: true

require_relative 'quarter'

module Registration
  class CurrentQuarter
    def initialize
      @quarter = Quarter.where(active: true).first
    end

    def get
      @quarter
    end
  end
end
