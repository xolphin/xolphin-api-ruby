require "spec_helper"

describe Xolphin::Api::CertificateRequests::CreateCertificateRequest do
  describe "#to_param" do
    it "returns parameters to send" do
      csr = File.read("spec/fixtures/test.csr")
      request = Xolphin::Api::CertificateRequests::CreateCertificateRequest.new(123, 1, csr, Xolphin::Api::DcvType::EMAIL)
      request.address = "W.M. Dudokweg 39"
      request.zipcode = "1703 DA"
      request.city = "Heerhugowaard"
      request.approver_first_name = "Xolphin"
      request.approver_last_name = "API Test"
      request.approver_email = "postmaster@ssl-test.nl"
      request.dcv = [{
        'domain' => 'test1.domain.com',
        'dcvType' => Xolphin::Api::DcvType::EMAIL,
        'approverEmail' => 'email@domain.com'
      }]

      params = request.to_param
      expect(params["product"]).to be(123)
      expect(params["years"]).to be(1)
      expect(params["csr"]).to eq(csr)
      expect(params["dcvType"]).to eq(Xolphin::Api::DcvType::EMAIL)
      expect(params["address"]).to eq("W.M. Dudokweg 39")
      expect(params["zipcode"]).to eq("1703 DA")
      expect(params["city"]).to eq("Heerhugowaard")
      expect(params["approverFirstName"]).to eq("Xolphin")
      expect(params["approverLastName"]).to eq("API Test")
      expect(params["approverEmail"]).to eq("postmaster@ssl-test.nl")

      dcv = JSON.parse(params["dcv"])
      expect(dcv).to be_instance_of(Array)
      expect(dcv.first).to be_instance_of(Hash)
    end
  end
end
