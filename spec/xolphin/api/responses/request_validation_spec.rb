require "spec_helper"

describe Xolphin::Api::Responses::RequestValidation do
  subject do
    data = { "status" => false, "statusDetail" => 0, "statusMessage" => "waiting", "domains" => [{ "domain" => "test8.ssl-test.nl", "status" => false, "statusDetail" => false, "statusMessage" => "waiting", "dcvType" => "EMAIL", "dcvEmail" => "postmaster@ssl-test.nl" }] }
    Xolphin::Api::Responses::RequestValidation.new(data)
  end

  describe "#status" do
    it "returns the status" do
      expect(subject.status).to eq(false)
    end
  end

  describe "#status_detail" do
    it "returns the status detail" do
      expect(subject.status_detail).to eq(0)
    end
  end

  describe "#status_message" do
    it "returns the status message" do
      expect(subject.status_message).to eq("waiting")
    end
  end

  describe "#domains" do
    it "returns the domains" do
      expect(subject.domains.length).to eq(1)
      expect(subject.domains.first).to be_instance_of(Xolphin::Api::Responses::RequestValidationDomain)
    end
  end
end
