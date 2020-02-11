# frozen_string_literal: true

module DB
  module MySQL
    module Queries
      class Update < Base
        def call
          query = builder.generate_update_query(@id, @attrs)

          connection.execute(query)
        end
      end
    end
  end
end
