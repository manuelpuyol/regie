# frozen_string_literal: true

require './db/mysql/record'

module Registration
  class Course < DB::MySQL::Record
    attr_accessor :id, :name, :code, :created_at, :updated_at

    def self.column_names
      %w[id name code created_at updated_at]
    end

    require_relative 'prerequisite'
    has_many :prerequisites_relations, klass: Prerequisite, dependent: :destroy, foreign_key: 'course_id'

    def prerequisites
      prerequisites_relations.map(&:prerequisite)
    end
  end
end
