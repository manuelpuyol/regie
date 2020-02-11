# frozen_string_literal: true

require_relative 'base'

module DB
  module MySQL
    module Queries
      class Destroy < Base
        def call
          query = builder.generate_destroy_query(id)

          connection.query(query)
        end
      end
    end
  end
end
