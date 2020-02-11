# frozen_string_literal: true

module DB
  module MySQL
    module Queries
      class Destroy < Base
        def call
          query = builder.generate_destroy_query(id)

          connection.execute(query)
        end
      end
    end
  end
end
