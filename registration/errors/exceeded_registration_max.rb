# frozen_string_literal: true

require_relative 'base'

module Registration
  module Errors
    class ExceededRegistrationMax < Base
      def initialize(msg = 'Cant enroll in more than 3 courses')
        super
      end
    end
  end
end
