# frozen_string_literal: true

require 'mysql2'

module DB
  module MySQL
    class Connection
      attr_reader :connection

      def initialize
        @connection = Mysql2::Client.new(
          host: 'localhost',
          username: 'manuelpuyol',
          password: '1234567890',
          database: 'regie_db'
        )
      end
    end
  end
end
