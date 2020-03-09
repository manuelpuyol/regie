# frozen_string_literal: true

require_relative '../quarter'

module Registration
  module Presenters
    class QuarterString
      def initialize(quarter)
        @quarter = quarter
      end

      def call
        "#{year} - #{Registration::Quarter::CODES[code.to_i]}"
      end

      private

      def year
        @quarter.split(' - ').first
      end

      def code
        @quarter.split(' - ').last
      end
    end
  end
end
