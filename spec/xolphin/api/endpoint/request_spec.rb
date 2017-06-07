require "spec_helper"

# Note: These specs make an actual HTTP request!
describe Xolphin::Api::Endpoint::Request, endpoint: true do
  subject do
    http = Xolphin::Api::Http.new("foo", "bar", test: true)
    Xolphin::Api::Endpoint::Request.new(http)
  end

  describe "#all" do
    it "returns all certificate requests" do
      response = subject.all
      expect(response).to be
    end
  end

  describe "#get" do
    it "returns one certificate request" do
      response = subject.get(960000008)
      expect(response).to be
    end
  end

  describe "#create" do
    it "create certificate request" do
      response = subject.create(18, 1, File.read("spec/fixtures/test.csr"), "email")
      expect(response).to be
    end
  end

  describe "#send" do
    it "sends the certificate request" do
      ccr = subject.create(18, 1, File.read("spec/fixtures/test.csr"), "email")
      response = subject.send(ccr)
      expect(response).to be
    end
  end
end
