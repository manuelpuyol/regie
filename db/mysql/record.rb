# frozen_string_literal: true

require 'active_support/inflector'
require 'active_support/core_ext/class/attribute'
require_relative 'queries/all'
require_relative 'queries/create'
require_relative 'queries/destroy'
require_relative 'queries/find'
require_relative 'queries/first'
require_relative 'queries/update'
require_relative 'queries/where'

module DB
  module MySQL
    class Record
      attr_accessor :id
      class_attribute :relations, instance_writer: false

      include Relations

      def initialize(attrs = {})
        if attrs.is_a?(Hash)
          assign_attributes(attrs)
        else
          assign_attributes(attrs.to_h)
        end
      end

      def ==(other)
        self.class == other.class &&
          self.class.columns_without_timestamps.all? do |col|
            instance_variable_get("@#{col}") == other.instance_variable_get("@#{col}")
          end
      end

      def reload(includes: nil)
        self.class.find(id, includes: includes)
      end

      def update(attrs)
        assign_attributes(attrs)

        self.class.update(id, attrs)
        true
      end

      def destroy
        destroy_dependents
        self.class.destroy(id)
        true
      rescue StandardError
        false
      end

      def save!
        result = self.class.create(to_h)
        assign_attributes(result.to_h)
        self
      end

      def assign_attributes(attrs = {})
        attrs.each_key do |key|
          instance_variable_set("@#{key}", attrs[key]) if column?(key)
        end
      end

      def to_h
        self.class.column_names.each_with_object({}) do |col, acc|
          acc[col] = instance_variable_get("@#{col}")
          acc
        end
      end

      class << self
        def all(includes: nil, limit: nil)
          Queries::All.new(
            record_class: self,
            includes: includes,
            limit: limit
          ).call
        end

        def create(attrs, includes: nil)
          Queries::Create.new(
            record_class: self,
            attrs: attrs,
            includes: includes
          ).call
        end

        def destroy(id)
          Queries::Destroy.new(
            record_class: self,
            id: id
          ).call
        end

        def find(id, includes: nil)
          Queries::Find.new(
            record_class: self,
            id: id,
            includes: includes
          ).call
        end

        def first(includes: nil)
          Queries::First.new(
            record_class: self,
            includes: includes
          ).call
        end

        def update(id, attrs)
          Queries::Update.new(
            record_class: self,
            id: id,
            attrs: attrs
          ).call
        end

        def where(args, includes: nil, limit: nil)
          Queries::Where.new(
            record_class: self,
            args: args,
            includes: includes,
            limit: limit
          ).call
        end

        def table_name
          name.split('::').last.underscore.pluralize
        end

        def column_names
          []
        end

        def columns_without_timestamps
          column_names - timestamp_columns
        end

        def timestamp_columns
          %w[created_at updated_at]
        end
      end

      private

      def destroy_dependents
        dependent_relations.each do |name, _relation|
          instances = send(name)
          instances&.each(&:destroy)
        end
      end

      def dependent_relations
        relations.select do |_name, relation|
          relation[:dependent] == :destroy
        end
      end

      def column?(key)
        self.class.column_names.include?(key.to_s)
      end
    end
  end
end
