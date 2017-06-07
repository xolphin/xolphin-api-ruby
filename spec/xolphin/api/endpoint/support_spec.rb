require "spec_helper"

# Note: These specs make an actual HTTP request!
describe Xolphin::Api::Endpoint::Support, endpoint: true do
  subject do
    http = Xolphin::Api::Http.new("foo", "bar", test: true)
    Xolphin::Api::Endpoint::Support.new(http)
  end

  describe "#products" do
    it "returns all products" do
      response = subject.products
      expect(response).to be
    end
  end

  describe "#product" do
    it "returns one certificate request" do
      response = subject.product(90)
      expect(response).to be
    end
  end

  describe "#decode_csr" do
    it "decodes a certificate request" do
      response = subject.decode_csr(File.read("spec/fixtures/test.csr"))
      expect(response).to be
    end
  end

  describe "#approver_email_addresses" do
    it "returns the approver email addresses" do
      response = subject.approver_email_addresses("test.nl")
      expect(response).to be
    end
  end
end
