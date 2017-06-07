module Xolphin
  module Api
    module Endpoint
      class Support
        def initialize(http)
          @http = http
        end

        def products
          products = []

          result = @http.get("/products", page: 1)
          response = Xolphin::Api::Responses::Products.new(result)

          unless response.error?
            products = response.products
            while response.page < response.pages
              result = @http.get("/products", page: response.page + 1)
              response = Xolphin::Api::Responses::Products.new(result)
              break if response.error?

              products += response.products
            end
          end

          products
        end

        def product(id)
          result = @http.get("/products/#{id}")

          Xolphin::Api::Responses::Product.new(result)
        end

        def decode_csr(csr)
          result = @http.post("/decode-csr", csr: csr)

          Xolphin::Api::Responses::CsrData.new(result)
        end

        def approver_email_addresses(domain)
          @http.get("/approver-email-addresses", domain: domain)
        end
      end
    end
  end
end
