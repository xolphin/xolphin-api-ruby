module Xolphin
  module Api
    module Responses
      class ProductPrice < Base
        def initialize(data)
          super(data)
        end

        def years
          @data["years"]
        end

        def price
          @data["price"]
        end

        def extra_price
          @data["extraPrice"]
        end

        def extra_price_wildcard
          @data["extraPriceWildcard"]
        end
      end
    end
  end
end
