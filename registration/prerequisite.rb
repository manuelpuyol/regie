# frozen_string_literal: true

require './db/mysql/record'

module Registration
  class Prerequisite < DB::MySQL::Record
    attr_accessor :id, :course_id, :prerequisite_id, :created_at, :updated_at

    def self.column_names
      %w[id course_id prerequisite_id created_at updated_at]
    end

    require_relative 'course'
    belongs_to :course, klass: Course
    belongs_to :prerequisite, klass: Course, foreign_key: 'prerequisite_id'
  end
end
