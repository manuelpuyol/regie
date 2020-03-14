# frozen_string_literal: true

require_relative '../fetchers/available_quarters'
require_relative 'quarter'

module Registration
  module Presenters
    class AvailableQuarters
      def call
        quarters.map do |quarter|
          Quarter.new(quarter).call
        end
      end

      private

      def quarters
        Registration::Fetchers::AvailableQuarters.new.call
      end
    end
  end
end
