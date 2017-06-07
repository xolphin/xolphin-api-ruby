module Xolphin
  module Api
    module Responses
      class Base
        def initialize(data)
          @data = data
        end

        def error?
          errors || message
        end

        def errors
          @data["errors"]
        end

        def message
          @data["message"]
        end

        def page
          @data["page"]
        end

        def pages
          @data["pages"]
        end

        def limit
          @data["limit"]
        end

        def total
          @data["total"]
        end

        def _embedded
          @data["_embedded"]
        end
      end
    end
  end
end
