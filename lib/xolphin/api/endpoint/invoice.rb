module Xolphin
  module Api
    module Endpoint
      class Invoice
        def initialize(http)
          @http = http
        end

        def all
          invoices = []

          result = @http.get("/invoices", page: 1)
          response = Xolphin::Api::Responses::Invoices.new(result)

          unless response.error?
            invoices = response.invoices
            while response.page < response.pages
              result = @http.get("/invoices", page: response.page + 1)
              response = Xolphin::Api::Responses::Invoices.new(result)
              break if response.error?

              invoices += response.invoices
            end
          end

          invoices
        end

        def get(id)
          result = @http.get("/invoices/#{id}")
          Xolphin::Api::Responses::Invoice.new(result)
        end

        def download(id, type = "PDF")
          @http.download("/invoices/#{id}/download", type: type)
        end
      end
    end
  end
end
