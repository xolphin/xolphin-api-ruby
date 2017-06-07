module Xolphin
  module Api
    module Responses
      class Product < Base
        def initialize(data)
          super(data)
        end

        def prices
          @prices ||= begin
            prices = []

            if @data["prices"]
              @data["prices"].each do |price|
                prices << ProductPrice.new(price)
              end
            end

            prices
          end
        end

        def id
          @data["id"]
        end

        def brand
          @data["brand"]
        end

        def name
          @data["name"]
        end

        def type
          @data["type"]
        end

        def validation
          @data["validation"]
        end

        def included_domains
          @data["includedDomains"]
        end

        def max_domains
          @data["maxDomains"]
        end
      end
    end
  end
end
