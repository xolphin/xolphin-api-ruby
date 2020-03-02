module Xolphin
  module Api
    module Endpoint
      class Certificate
        def initialize(http)
          @http = http
        end

        def all
          certificates = []

          result = @http.get("/certificates", page: 1)
          response = Xolphin::Api::Responses::Certificates.new(result)

          unless response.error?
            certificates = response.certificates
            while response.page < response.pages
              result = @http.get("/certificates", page: response.page + 1)
              response = Xolphin::Api::Responses::Certificates.new(result)
              break if response.error?

              certificates += response.certificates
            end
          end

          certificates
        end

        def get(id)
          result = @http.get("/certificates/#{id}")

          Xolphin::Api::Responses::Certificate.new(result)
        end

        def download(id, format = Xolphin::Api::FormatType::CRT)
          @http.download("/certificates/#{id}/download", format: format)
        end

        def reissue(id, request)
          result = @http.post("/certificates/#{id}/reissue", request.to_param)
          Xolphin::Api::Responses::Requests.new(result)
        end

        def renew(id, request)
          result = @http.post("/certificates/#{id}/renew", request.to_param)
          Xolphin::Api::Responses::Requests.new(result)
        end

        def cancel(id, reason, revoke = nil)
          revoke ||= false
          @http.post("/certificates/#{id}/cancel", [
                       'reason' => reason,
                       'revoke' => revoke
                     ])
        end
      end
    end
  end
end
