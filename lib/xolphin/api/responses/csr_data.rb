module Xolphin
  module Api
    module Responses
      class CsrData < Base
        def initialize(data)
          super(data)
        end

        def type
          @data["type"]
        end

        def size
          @data["size"]
        end

        def company
          @data["company"]
        end

        def cn
          @data["cn"]
        end

        def state
          @data["state"]
        end

        def city
          @data["city"]
        end

        def country
          @data["country"]
        end

        def alt_names
          @data["altNames"]
        end
      end
    end
  end
end
