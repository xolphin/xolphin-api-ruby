module Xolphin
  module Api
    module Responses
      class RequestValidationDomain < Base
        def initialize(data)
          super(data)
        end

        def domain
          @data["domain"]
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

        def dcv_type
          @data["dcvType"]
        end

        def dcv_email
          @data["dcvEmail"]
        end

        def dns_record
          @data["dnsRecord"]
        end

        def dns_cname_value
          @data["dnsCnameValue"]
        end

        def file_location
          @data["fileLocation"]
        end

        def file_contents
          @data["fileContents"]
        end
      end
    end
  end
end
