# frozen_string_literal: true

require './db/mysql/record'

module Registration
  class Quarter < DB::MySQL::Record
    attr_accessor :id, :year, :code, :created_at, :updated_at

    CODES = {
      1 => 'Winter',
      2 => 'Spring',
      3 => 'Summer',
      4 => 'Fall'
    }.freeze

    def self.column_names
      %w[id year code created_at updated_at]
    end

    require_relative 'course_section'
    has_many :course_sections, klass: CourseSection
  end
end
