module Xolphin
  module Api
    module Responses
      class ValidationCalls < Base
        def initialize(data)
          super(data)
        end

        def calls
          @calls ||= begin
            calls = []

            if @data["list"]
              @data["list"].each do |call|
                calls << ValidationCall.new(call)
              end
            end

            calls
          end
        end
      end
    end
  end
end
