require "spec_helper"

# Note: These specs make an actual HTTP request!
describe Xolphin::Api::Endpoint::Certificate, endpoint: true do
  subject do
    http = Xolphin::Api::Http.new("foo", "bar", test: true)
    Xolphin::Api::Endpoint::Certificate.new(http)
  end

  describe "#all" do
    it "returns all certificates" do
      response = subject.all
      expect(response).to be
    end
  end

  describe "#get" do
    it "returns one certificate" do
      response = subject.get(960000029)
      expect(response).to be
    end
  end

  describe "#download" do
    it "downloads a certificate" do
      response = subject.download(960000031)
      expect(response).to be
    end
  end
end
