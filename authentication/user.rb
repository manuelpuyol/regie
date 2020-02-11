# frozen_string_literal: true

require './db/mysql/record'

module Authentication
  class User < DB::MySQL::Record
    attr_accessor :id, :name, :email, :password, :type, :created_at, :updated_at

    def self.column_names
      %w[id name email password type created_at updated_at]
    end
  end
end
