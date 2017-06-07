require 'time'

module Xolphin
  module Api
    module Responses
      class Request < Base
        def initialize(data)
          super(data)
        end

        def id
          @data["id"]
        end

        def domain_name
          @data["domainName"]
        end

        def company
          @data["company"]
        end

        def date_ordered
          Time.parse(@data["dateOrdered"])
        end

        def subject_alternative_names
          @data["subjectAlternativeNames"]
        end

        def years
          @data["years"]
        end

        def department
          @data["department"]
        end

        def address
          @data["address"]
        end

        def zipcode
          @data["zipcode"]
        end

        def city
          @data["city"]
        end

        def province
          @data["province"]
        end

        def country
          @data["country"]
        end

        def reference
          @data["reference"]
        end

        def approver_first_name
          @data["approverFirstName"]
        end

        def approver_last_name
          @data["approverLastName"]
        end

        def approver_email
          @data["approverEmail"]
        end

        def approver_phone
          @data["approverPhone"]
        end

        def postbox
          @data["postbox"]
        end

        def kvk
          @data["kvk"]
        end

        def reqiures_action
          @data["requiresAction"]
        end

        def brand_validation
          @data["brandValidation"]
        end

        def validations
          @validations ||= begin
            validations = []

            if @data["validations"]
              @data["validations"].each do |validation|
                validations << RequestValidation.new(validation)
              end
            end

            validations
          end
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
