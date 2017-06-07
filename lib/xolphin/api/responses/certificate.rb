require 'time'

module Xolphin
  module Api
    module Responses
      class Certificate < Base
        def initialize(data)
          super(data)
        end

        def id
          @data["id"]
        end

        def domain_name
          @data["domainName"]
        end

        def subject_alternative_names
          @data["subjectAlternativeNames"]
        end

        def date_issued
          Time.parse(@data["dateIssued"])
        end

        def date_expired
          Time.parse(@data["dateExpired"])
        end

        def company
          @data["company"]
        end

        def customer_id
          @data["customerId"]
        end

        def expired?
          date_expired <= Time.now
        end

        def product
          @product ||= begin
            if _embedded && _embedded["product"]
              Product.new(_embedded["product"])
            end
          end
        end
      end
    end
  end
end
