# frozen_string_literal: true

module Registration
  class Laboratory
    attr_accessor :name

    def initialize(name:)
      @name = name
    end
  end
end
