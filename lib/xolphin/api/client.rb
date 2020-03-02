module Xolphin
  module Api
    class Client
      def initialize(username, password, test = false)
        @http = Xolphin::Api::Http.new(username, password, test: test)
      end

      def request
        Xolphin::Api::Endpoint::Request.new(@http)
      end

      def certificate
        Xolphin::Api::Endpoint::Certificate.new(@http)
      end

      def support
        Xolphin::Api::Endpoint::Support.new(@http)
      end

      def invoice
        Xolphin::Api::Endpoint::Invoice.new(@http)
      end
    end
  end
end
