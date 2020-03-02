require 'time'

module Xolphin
  module Api
    module Responses
      class Note < Base
        def initialize(data)
          super(data)
        end

        def id
          @data["id"]
        end

        def contact
          @data["contact"]
        end

        def staff
          @data["staff"]
        end

        def date
          @data["date"]
        end

        def time
          @data["time"]
        end

        def message_body
          @data["message"]
        end

        def created_at
          Time.parse(@data["createdAt"])
        end

        def end_customer
          @data['endCustomer']
        end
      end
    end
  end
end
