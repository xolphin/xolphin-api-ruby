require 'json'

module Xolphin
  module Api
    module CertificateRequests
      class CreateEERequest
        attr_accessor :csr, :dcv_type, :subject_alternative_names, :validate
        attr_accessor :approver_first_name, :approver_last_name, :approver_email, :approver_phone

        def to_param
          result = {
            "csr" => @csr,
            "dcvType" => @dcv_type,
            "approverFirstName" => @approver_first_name,
            "approverLastName" => @approver_last_name,
            "approverEmail" => @approver_email,
            "approverPhone" => @approver_phone,
          }

          if @validate
            result['validate'] = true;
          end

          if @subject_alternative_names
            result["subjectAlternativeNames"] = @subject_alternative_names.join(",")
          end

          result
        end
      end
    end
  end
end
