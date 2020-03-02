require "spec_helper"

# Note: These specs make an actual HTTP request!
describe Xolphin::Api::Endpoint::Invoice, endpoint: true do
  subject do
    http = Xolphin::Api::Http.new("foo", "bar", test: true)
    Xolphin::Api::Endpoint::Invoice.new(http)
  end

  describe "#invoices" do
    it "returns all invoices" do
      response = subject.all
      expect(response).to be
    end
  end

  describe "#invoice" do
    it "returns one invoice" do
      response = subject.get(223873)
      expect(response).to be
    end
  end

  describe "#download_invoice" do
    it "download a invoice" do
      response = subject.download(223873, Xolphin::Api::InvoiceFormatType::PDF)
      expect(response).to be
    end
  end
end
