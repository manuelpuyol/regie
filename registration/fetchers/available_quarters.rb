# frozen_string_literal: true

require_relative '../quarter'

module Registration
  module Fetchers
    class AvailableQuarters
      def call
        Registration::Quarter.all.sort_by { |q| [q.year, q.code] }
      end
    end
  end
end
