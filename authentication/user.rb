# frozen_string_literal: true

require './db/mysql/record'

module Authentication
  class User < DB::MySQL::Record
    TYPES = {
      student: 1,
      staff: 2,
      admin: 3
    }.freeze

    attr_accessor :id, :name, :email, :password, :type, :created_at, :updated_at

    def self.column_names
      %w[id name email password type created_at updated_at]
    end

    def student?
      type == TYPES[:student]
    end

    def staff?
      type == TYPES[:staff]
    end

    def admin?
      type == TYPES[:admin]
    end
  end
end
