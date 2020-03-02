require 'json'

module Xolphin
  module Api
    module CertificateRequests
      class CreateCertificateRequest
        attr_accessor :product, :years, :csr, :dcv_type, :subject_alternative_names, :dcv, :language
        attr_accessor :company, :department, :address, :zipcode, :city, :kvk, :reference, :referenceOrderNr
        attr_accessor :approver_first_name, :approver_last_name, :approver_email, :approver_phone

        def initialize(product, years, csr, dcv_type)
          @product = product
          @years = years
          @csr = csr
          @dcv_type = dcv_type
        end

        def to_param
          result = {
            "product" => @product,
            "years"   => @years,
            "csr"     => @csr,
            "dcvType" => @dcv_type
          }

          result.merge!({
            "company"           => @company,
            "department"        => @department,
            "address"           => @address,
            "zipcode"           => @zipcode,
            "city"              => @city,
            "kvk"               => @kvk,
            "reference"         => @reference,
            "approverFirstName" => @approver_first_name,
            "approverLastName"  => @approver_last_name,
            "approverEmail"     => @approver_email,
            "approverPhone"     => @approver_phone,
            "language"          => @language,
            "referenceOrderNr"  => @referenceOrderNr
          }.reject { |_key, value| value.nil? })

          if @subject_alternative_names
            result["subjectAlternativeNames"] = @subject_alternative_names.join(",")
          end

          result["dcv"] = JSON.dump(@dcv) if @dcv

          result
        end
      end
    end
  end
end
