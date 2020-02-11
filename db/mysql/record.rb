# frozen_string_literal: true

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

      def self.included(base)
        base.class_eval do
          include Relations
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

      def assign_attributes(attrs)
        # TODO
      end

      class << self
        def all(includes: nil, limit: nil)
          Queries::All.new(includes: includes, limit: limit).call
        end

        def create(attrs, includes: nil)
          Queries::Create.new(attrs, includes: includes).call
        end

        def destroy(id)
          Queries::Destroy.new(id).call
        end

        def find(id, includes: nil)
          Queries::Find.new(id, includes: includes).call
        end

        def first(includes: nil)
          Queries::First.new(includes: includes).call
        end

        def update(id, attrs)
          Queries::Update.new(id, attrs).call
        end

        def where(args, includes: nil, limit: nil)
          Queries::Where.new(args, includes: includes, limit: limit).call
        end
      end

      private

      def table_name
        raise NotImplementedError
      end

      def column_names
        raise NotImplementedError
      end

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
    end
  end
end
