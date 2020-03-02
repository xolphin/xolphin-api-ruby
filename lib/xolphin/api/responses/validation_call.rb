module Xolphin
  module Api
    module Responses
      class ValidationCall < Base
        def initialize(data)
          super(data)
        end

        def request_id
          @data['requestId']
        end

        def date
          @data['date']
        end

        def time
          @data['time']
        end
      end
    end
  end
end
