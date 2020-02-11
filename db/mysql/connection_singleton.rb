# frozen_string_literal: true

require 'singleton'
require_relative 'connection'

module DB
  module MySQL
    class ConnectionSingleton < Connection
      include Singleton

      def get
        @connection
      end

      def set(connection)
        @connection = connection
      end
    end
  end
end
