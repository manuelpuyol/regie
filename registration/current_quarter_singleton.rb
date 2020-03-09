# frozen_string_literal: true

require 'singleton'
require_relative 'current_quarter'

module Registration
  class CurrentQuarterSingleton < CurrentQuarter
    include Singleton
  end
end
