# frozen_string_literal: true

module DB
  module MySQL
    class Record
      def self.included(base)
        base.class_eval do
          include Relations
          include Queries::Base
        end
      end
    end
  end
end
