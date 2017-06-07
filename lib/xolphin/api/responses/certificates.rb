module Xolphin
  module Api
    module Responses
      class Certificates < Base
        def initialize(data)
          super(data)
        end

        def certificates
          @certificates ||= begin
            certificates = []

            if _embedded && _embedded["certificates"]
              _embedded["certificates"].each do |certificate|
                certificates << Certificate.new(certificate)
              end
            end

            certificates
          end
        end
      end
    end
  end
end
