require "spec_helper"

describe Xolphin::Api::Responses::Request do
  subject do
    data = { "id" => 960000008, "domainName" => "test8.ssl-test.nl", "company" => "Xolphin B.V.", "dateOrdered" => "2016-05-23T09:56:03+0200", "subjectAlternativeNames" => [], "years" => 1, "department" => nil, "address" => "W.M. Dudokweg 39", "zipcode" => "1703 DA", "city" => "Heerhugowaard", "province" => nil, "country" => "NL", "reference" => nil, "approverFirstName" => "Xolphin", "approverLastName" => "API Test", "approverEmail" => "postmaster@ssl-test.nl", "approverPhone" => "+31887757750", "postbox" => nil, "kvk" => nil, "validations" => { "request" => { "status" => false, "statusDetail" => 0, "statusMessage" => "waiting" }, "organization" => { "status" => false, "statusDetail" => 0, "statusMessage" => "waiting" }, "whois" => { "status" => false, "statusDetail" => 0, "statusMessage" => "waiting" }, "phone" => { "status" => false, "statusDetail" => 0, "statusMessage" => "waiting" }, "dcv" => { "status" => false, "statusDetail" => 0, "statusMessage" => "waiting", "domains" => [{ "domain" => "test8.ssl-test.nl", "status" => false, "statusDetail" => false, "statusMessage" => "waiting", "dcvType" => "EMAIL", "dcvEmail" => "postmaster@ssl-test.nl" }] } }, "requiresAction" => false, "_links" => { "self" => { "href" => "/v1/requests/960000008" }, "scheduleValidationCall" => { "href" => "/v1/requests/960000008/schedule-validation-call" }, "retryDcv" => { "href" => "/v1/requests/960000008/retry-dcv" } }, "_embedded" => { "product" => { "id" => 2, "name" => "InstantSSL", "brand" => "Comodo", "_links" => { "self" => { "href" => "/v1/products/2" } } }, "notes" => [] } }
    Xolphin::Api::Responses::Request.new(data)
  end

  describe "#id" do
    it "returns the request id" do
      expect(subject.id).to eq(960000008)
    end
  end

  describe "#domain_name" do
    it "returns the domain name" do
      expect(subject.domain_name).to eq("test8.ssl-test.nl")
    end
  end

  describe "#company" do
    it "returns the company name" do
      expect(subject.company).to eq("Xolphin B.V.")
    end
  end

  describe "#date_ordered" do
    it "returns the date ordered" do
      expect(subject.date_ordered).to be_instance_of(Time)
      expect(subject.date_ordered).to eq(Time.parse("2016-05-23T09:56:03+0200"))
    end
  end

  describe "#subject_alternative_names" do
    it "returns the request id" do
      expect(subject.subject_alternative_names).to eq([])
    end
  end

  describe "#years" do
    it "returns the number of years" do
      expect(subject.years).to eq(1)
    end
  end

  describe "#department" do
    it "returns the department" do
      expect(subject.department).to be nil
    end
  end

  describe "#address" do
    it "returns the address" do
      expect(subject.address).to eq("W.M. Dudokweg 39")
    end
  end

  describe "#zipcode" do
    it "returns the zipcode" do
      expect(subject.zipcode).to eq("1703 DA")
    end
  end

  describe "#city" do
    it "returns the city" do
      expect(subject.city).to eq("Heerhugowaard")
    end
  end

  describe "#province" do
    it "returns the province" do
      expect(subject.province).to be nil
    end
  end

  describe "#country" do
    it "returns the country" do
      expect(subject.country).to eq("NL")
    end
  end

  describe "#reference" do
    it "returns the reference" do
      expect(subject.reference).to be nil
    end
  end

  describe "#approver_first_name" do
    it "returns the approver first name" do
      expect(subject.approver_first_name).to eq("Xolphin")
    end
  end

  describe "#approver_last_name" do
    it "returns the approver last name" do
      expect(subject.approver_last_name).to eq("API Test")
    end
  end

  describe "#approver_email" do
    it "returns the approver email address" do
      expect(subject.approver_email).to eq("postmaster@ssl-test.nl")
    end
  end

  describe "#approver_phone" do
    it "returns the approver phone" do
      expect(subject.approver_phone).to eq("+31887757750")
    end
  end

  describe "#postbox" do
    it "returns the postbox" do
      expect(subject.postbox).to be nil
    end
  end

  describe "#kvk" do
    it "returns the kvk" do
      expect(subject.kvk).to be nil
    end
  end

  describe "#validations" do
    it "returns the validations" do
      expect(subject.validations.length).to eq(5)
      expect(subject.validations.first).to be_instance_of(Xolphin::Api::Responses::RequestValidation)
    end
  end

  describe "#product" do
    it "returns the product" do
      expect(subject.product).to be_instance_of(Xolphin::Api::Responses::Product)
    end
  end
end
