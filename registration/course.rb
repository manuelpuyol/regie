# frozen_string_literal: true

require './db/mysql/record'

module Registration
  class Course < DB::MySQL::Record
    attr_accessor :id, :name, :code, :created_at, :updated_at

    def self.column_names
      %w[id name code created_at updated_at]
    end
  end
end
