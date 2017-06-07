module Xolphin
  module Api
    module Responses
      class Products < Base
        def initialize(data)
          super(data)
        end

        def products
          @products ||= begin
            products = []

            if _embedded && _embedded["products"]
              _embedded["products"].each do |product|
                products << Product.new(product)
              end
            end

            products
          end
        end
      end
    end
  end
end
