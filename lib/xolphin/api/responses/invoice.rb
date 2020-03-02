require 'time'

module Xolphin
  module Api
    module Responses
      class Invoice < Base
        def initialize(data)
          super(data)
        end

        def id
          @data['id']
        end

        def currency
          @data['currency']
        end

        def amount
          @data['amount']
        end

        def tax
          @data['tax']
        end

        def invoice_number
          @data['invoiceNr']
        end

        def amount_paid
          @data['amountPaid']
        end

        def status
          @data['status']
        end

        def total
          @data['total']
        end

        def date_created
          Time.parse(@data['date_created'])
        end

        def date_reminder
          Time.parse(@data['date_reminder'])
        end

        def date_payed
          Time.parse(@data['date_payed'])
        end
      end
    end
  end
end
