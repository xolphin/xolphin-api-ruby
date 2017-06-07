require "spec_helper"

describe Xolphin::Api::Responses::RequestValidationDomain do
  subject do
    data = { "domain" => "test8.ssl-test.nl", "status" => false, "statusDetail" => false, "statusMessage" => "waiting", "dcvType" => "EMAIL", "dcvEmail" => "postmaster@ssl-test.nl" }
    Xolphin::Api::Responses::RequestValidationDomain.new(data)
  end

  describe "#domain" do
    it "returns the domain" do
      expect(subject.domain).to eq("test8.ssl-test.nl")
    end
  end

  describe "#status" do
    it "returns the status" do
      expect(subject.status).to eq(false)
    end
  end

  describe "#status_detail" do
    it "returns the status detail" do
      expect(subject.status_detail).to eq(false)
    end
  end

  describe "#status_message" do
    it "returns the status message" do
      expect(subject.status_message).to eq("waiting")
    end
  end

  describe "#dcv_type" do
    it "returns the dcv type" do
      expect(subject.dcv_type).to eq(Xolphin::Api::DcvType::EMAIL)
    end
  end

  describe "#dcv_email" do
    it "returns the dcv email" do
      expect(subject.dcv_email).to eq("postmaster@ssl-test.nl")
    end
  end
end
