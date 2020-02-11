# frozen_string_literal: true

module DB
  module MySQL
    module Queries
      class Builder
        def initialize(table_name:, column_names:)
          @table_name = table_name
          @column_names = column_names
        end

        def generate_query(includes:, limit: nil)
          include_sql_hash = generate_includes(includes)
          select_fields = include_sql_hash[:select] << select_columns_from_model(self)

          select_statement = "SELECT #{select_fields.join(', ')} FROM #{@table_name}"
          join_statements = include_sql_hash[:join].join(' ')

          "#{select_statement} #{join_statements} #{limit_statement(limit)}"
        end

        def find_statement(id)
          "WHERE #{@table_name}.id = #{id.to_i}"
        end

        def first_statement
          "ORDER BY #{@table_name}.id ASC LIMIT 1"
        end

        def where_statement(args)
          case args
          when Hash
            sanitize_sql_for_conditions(hash_where_statement(args))
          when String, Array
            sanitize_sql_for_conditions(args)
          else
            raise ArgumentError, "Unexpected argument type #{args.class}"
          end
        end

        def limit_statement(limit)
          return '' if limit.blank?

          "LIMIT #{limit.to_i}"
        end

        def generate_update_query(id, attrs)
          "UPDATE #{@table_name} SET #{set_statement(attrs)} WHERE #{@table_name}.id = #{id.to_i}"
        end

        def generate_create_query(attrs)
          sorted_columns = @column_names.sort - ['id']
          columns = sorted_columns.join(', ')
          column_values = sorted_columns.map do |col|
            if %w[created_at updated_at].include?(col)
              'NOW()'
            else
              sanitize_sql_for_assignment(['?', attrs[col]])
            end
          end.join(', ')

          "INSERT INTO #{@table_name} (#{columns}) VALUES (#{column_values}) RETURNING id"
        end

        def generate_destroy_query(id)
          "DELETE FROM #{@table_name} WHERE id = #{id.to_i}"
        end

        private

        def set_statement(attrs)
          update_attrs = attrs.map do |key, value|
            if value.nil?
              "#{key} = NULL"
            else
              sanitize_sql_for_conditions(["#{key} = ?", value])
            end
          end.join(', ')

          "#{update_attrs}, updated_at = NOW()"
        end

        def generate_includes(includes)
          base_hash = { select: [], join: [] }

          return base_hash if includes.nil?

          includes = [includes] unless includes.is_a?(Array)

          includes.each_with_object(base_hash) do |include, obj|
            single_include = generate_single_include(include)
            obj[:select] << single_include[:select]
            obj[:join] << single_include[:join]
          end
        end

        def generate_single_include(include)
          relation = relations[include]

          case relation[:type]
          when CounterRecord::Relations::RELATION_TYPES[:has_many]
            if relation[:through].blank?
              build_has_many_join(relation)
            else
              build_has_many_through_join(relation)
            end
          when CounterRecord::Relations::RELATION_TYPES[:belongs_to]
            build_belongs_to_join(relation)
          else
            raise ArgumentError, "Unexpected relation type #{relation.dig(:type)}"
          end
        end

        def build_has_many_join(relation)
          relation_model = relation[:klass]
          table_alias = relation[:table_alias]
          relation_table = relation[:table_name]
          column_name = relation[:column_name]

          {
            select: select_columns_from_model(relation_model, table_alias),
            join: ["LEFT JOIN #{relation_table} AS #{table_alias} ON #{table_alias}.#{column_name} = #{@table_name}.id"]
          }
        end

        def build_has_many_through_join(relation)
          relation_model = relation[:klass]
          table_alias = relation[:table_alias]
          relation_table = relation[:table_name]
          column_name = relation[:column_name]
          through_relation = relations[relation[:through]]
          through_table = through_relation[:table_alias]

          {
            select: select_columns_from_model(relation_model, table_alias),
            join: ["LEFT JOIN #{relation_table} AS #{table_alias} ON #{through_table}.#{column_name} = #{table_alias}.id"]
          }
        end

        def build_belongs_to_join(relation)
          relation_model = relation[:klass]
          table_alias = relation[:table_alias]
          relation_table = relation[:table_name]
          column_name = relation[:column_name]

          {
            select: select_columns_from_model(relation_model, table_alias),
            join: ["LEFT JOIN #{relation_table} AS #{table_alias} ON #{table_alias}.id = #{@table_name}.#{column_name}"]
          }
        end

        def select_columns_from_model(klass, table_alias = nil)
          table = table_alias || klass.table_name

          klass.column_names.map { |col| "#{table}.#{col} AS #{table}_#{col}" }.join(', ')
        end

        def hash_where_statement(kwargs)
          kwargs.map do |key, value|
            case value
            when Array
              "#{@table_name}.#{key} #{sanitize_sql_for_conditions(value)}"
            when NilClass
              "#{@table_name}.#{key} IS NULL"
            else
              sanitize_sql_for_conditions(["#{@table_name}.#{key} = ?", value])
            end
          end.join(' AND ')
        end
      end
    end
  end
end
