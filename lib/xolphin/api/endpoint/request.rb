require 'time'

module Xolphin
  module Api
    module Endpoint
      class Request
        def initialize(http)
          @http = http
        end

        def all
          requests = []

          result = @http.get("/requests", page: 1)
          response = Xolphin::Api::Responses::Requests.new(result)

          unless response.error?
            requests = response.requests
            while response.page < response.pages
              result = @http.get("/requests", page: response.page + 1)
              response = Xolphin::Api::Responses::Requests.new(result)
              break if response.error?

              requests += response.requests
            end
          end

          requests
        end

        def get(id)
          result = @http.get("/requests/#{id}")

          Xolphin::Api::Responses::Request.new(result)
        end

        def create(product, years, csr, dcv_type)
          Xolphin::Api::CertificateRequests::CreateCertificateRequest.new(product, years, csr, dcv_type)
        end

        def send(request)
          result = @http.post("/requests", request.to_param)

          Xolphin::Api::Responses::Request.new(result)
        end

        def createEE
          Xolphin::Api::CertificateRequests::CreateEERequest.new
        end

        def sendEE(request)
          result = @http.post("/requests/ee", request.to_param)

          Xolphin::Api::Responses::RequestEE.new(result)
        end

        def sendNote(id, note)
          @http.post("/requests/#{id}/notes", 'message' => note)
        end

        def getNotes(id)
          result = @http.get("/requests/#{id}/notes")

          Xolphin::Api::Responses::Notes.new(result)
        end

        def sendComodoSAEmail(id, to, language = nil)
          @http.post("requests/#{id}/sa", 'sa_email' => to, 'language' => language)
        end

        def upload(id, document, description = nil)
          @http.post("requests/#{id}/upload-document", 'document' => document, 'description' => description)
        end

        def scheduleValidationCall(id, date_time)
          t = Time.parse(date_time)
          @http.post("requests/#{id}/schedule-validation-call", 'date' => t.strftime("%Y-%m-%d"), 'time' => t.strftime("%H:%M"))
        end

        def retryDCV(id, domain, dcv_type, email = nil)
          @http.post("requests/#{id}/retry-dcv", "domain" => domain, "dcvType" => dcv_type, "email" => email)
        end

        def cancel(id, reason = "")
          @http.post("requests/#{id}/cancel", "reason" => reason)
        end
      end
    end
  end
end
