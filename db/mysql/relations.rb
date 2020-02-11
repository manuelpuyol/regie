# frozen_string_literal: true

require_relative 'class_inferrer'

module DB
  module MySQL
    module Relations
      RELATION_TYPES = {
        belongs_to: 'BelongsTo',
        has_many: 'HasMany'
      }.freeze

      def self.included(base)
        base.class_eval do
          extend ClassMethods
          class_attribute :relations, instance_writer: false
          self.relations = {}
        end
      end

      module ClassMethods
        def belongs_to(name, class_name: nil, polymorphic: false)
          super
          add_relation(name, type: :belongs_to, class_name: class_name, polymorphic: polymorphic)

          define_method(name) do
            relation = relations[name]

            return instance_variable_get(relation[:variable_name]) if instance_variable_get(relation[:variable_name])

            instance_variable_set(relation[:variable_name], relation[:klass].find(send(relation[:column_name])))
          end
        end

        # rubocop:disable Naming/PredicateName
        def has_many(name, class_name: nil, foreign_key: "#{table_name.singularize}_id", through: nil, dependent: nil)
          add_relation(name, type: :has_many, class_name: class_name, foreign_key: foreign_key, through: through, dependent: dependent)

          define_method(name) do
            relation = relations[name]

            return instance_variable_get(relation[:variable_name]) if instance_variable_get(relation[:variable_name])

            instance_variable_set(relation[:variable_name], relation[:klass].where(relation[:column_name] => id))
          end

          define_method("#{name}_count") do
            relation = relations[name]
            count_variable = "#{relation[:variable_name]}_count"

            return instance_variable_get(count_variable) if instance_variable_get(count_variable)

            send(name).size
          end
        end
        # rubocop:enable Naming/PredicateName

        private

        def add_relation(name, type:, class_name:, foreign_key: nil, polymorphic: false, through: nil, dependent: nil)
          relation_klass = ClassInferrer.infer(name, class_name, polymorphic)

          self.relations = relations.dup
          relations[name] = {
            type: RELATION_TYPES[type],
            klass: relation_klass,
            table_name: relation_klass&.table_name,
            table_alias: name.to_s.pluralize,
            column_name: foreign_key || "#{name}_id",
            variable_name: "@#{name}",
            polymorphic: polymorphic,
            through: through,
            dependent: dependent
          }
        end
      end
    end
  end
end
