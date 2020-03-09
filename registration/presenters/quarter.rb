# frozen_string_literal: true

require_relative 'quarter_string'

module Registration
  module Presenters
    class Quarter
      def initialize(quarter)
        @quarter = quarter
      end

      def call
        QuarterString.new("#{@quarter.year} - #{@quarter.code}").call
      end
    end
  end
end
