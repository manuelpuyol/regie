# frozen_string_literal: true

require_relative 'base'

module DB
  module MySQL
    module Queries
      class Update < Base
        def call
          query = builder.generate_update_query(@id, @attrs)

          connection.query(query)
        end
      end
    end
  end
end
