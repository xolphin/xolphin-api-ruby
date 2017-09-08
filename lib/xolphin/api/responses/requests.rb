module Xolphin
  module Api
    module Responses
      class Requests < Base
        def initialize(data)
          super(data)
        end

        def requests
          @requests ||= begin
            requests = []

            if _embedded && _embedded["requests"]
              _embedded["requests"].each do |request|
                requests << Request.new(request)
              end
            end

            requests
          end
        end

        def id
          @data["id"]
        end
      end
    end
  end
end
