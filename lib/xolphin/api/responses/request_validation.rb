module Xolphin
  module Api
    module Responses
      class RequestValidation < Base
        def initialize(data)
          super(data)
        end

        def status
          @data["status"]
        end

        def status_detail
          @data["statusDetail"]
        end

        def status_message
          @data["statusMessage"]
        end

        def domains
          @domains ||= begin
            domains = []

            if @data["domains"]
              @data["domains"].each do |domain|
                domains << RequestValidationDomain.new(domain)
              end
            end

            domains
          end
        end
      end
    end
  end
end
