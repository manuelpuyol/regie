# frozen_string_literal: true

require 'mysql2'

module DB
  module MySQL
    class Connection
      attr_reader :connection

      def initialize
        @connection = Mysql2::Client.new(
          host: 'localhost',
          username: ENV['DB_USERNAME'],
          password: ENV['DB_PASSOWRD'],
          database: ENV['DB_NAME']
        )
      end
    end
  end
end
