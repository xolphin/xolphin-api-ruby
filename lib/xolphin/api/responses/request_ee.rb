require 'time'

module Xolphin
  module Api
    module Responses
      class RequestEE < Base
        def initialize(data)
          super(data)
        end

        def id
          @data["id"]
        end

        def date_ordered
          Time.parse(@data["dateOrdered"])
        end

        def certificate
          @data["certificate"]
        end

        def pkcs7
          @data["pkcs7"]
        end
      end
    end
  end
end
