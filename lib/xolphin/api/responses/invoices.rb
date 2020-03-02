module Xolphin
  module Api
    module Responses
      class Invoices < Base
        def initialize(data)
          super(data)
        end

        def invoices
          @invoices ||= begin
            invoices = []

            if _embedded && _embedded["invoices"]
              _embedded["invoices"].each do |invoice|
                invoices << Invoice.new(invoice)
              end
            end

            invoices
          end
        end
      end
    end
  end
end
