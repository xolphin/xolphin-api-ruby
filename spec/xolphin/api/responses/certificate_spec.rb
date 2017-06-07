require "spec_helper"

describe Xolphin::Api::Responses::Certificate do
  subject do
    data = { "id" => 960000029, "domainName" => "test29.ssl-test.nl", "dateIssued" => "2016-05-23T00:00:00+0200", "dateExpired" => "2017-05-23T00:00:00+0200", "company" => "Xolphin B.V.", "customerId" => nil, "subjectAlternativeNames" => [], "_links" => { "self" => { "href" => "/v1/certificates/960000029" }, "reissue" => { "href" => "/v1/certificates/960000029/reissue" }, "renew" => { "href" => "/v1/certificates/960000029/renew" }, "cancel" => { "href" => "/v1/certificates/960000029/cancel" }, "download" => { "href" => "/v1/certificates/960000029/download" } }, "_embedded" => { "product" => { "id" => 11, "name" => "RapidSSL", "brand" => "GeoTrust", "_links" => { "self" => { "href" => "/v1/products/11" } } } } }
    Xolphin::Api::Responses::Certificate.new(data)
  end

  describe "#id" do
    it "returns the certificate id" do
      expect(subject.id).to eq(960000029)
    end
  end

  describe "#domain_name" do
    it "returns the domain name" do
      expect(subject.domain_name).to eq("test29.ssl-test.nl")
    end
  end

  describe "#subject_alternative_names" do
    it "returns the subject alternative_names" do
      expect(subject.subject_alternative_names).to eq([])
    end
  end

  describe "#date_issued" do
    it "returns the date of issue" do
      expect(subject.date_issued).to be_instance_of(Time)
      expect(subject.date_issued).to eq(Time.parse("2016-05-23T00:00:00+0200"))
    end
  end

  describe "#date_expired" do
    it "returns the date of expiration" do
      expect(subject.date_expired).to be_instance_of(Time)
      expect(subject.date_expired).to eq(Time.parse("2017-05-23T00:00:00+0200"))
    end
  end

  describe "#company" do
    it "returns the company name" do
      expect(subject.company).to eq("Xolphin B.V.")
    end
  end

  describe "#customer_id" do
    it "returns the customer ID" do
      expect(subject.customer_id).to be nil
    end
  end

  describe "#expired?" do
    it "returns true when the certificate has been expired" do
      certificate = Xolphin::Api::Responses::Certificate.new("dateExpired" => (Date.today - 1).to_s)
      expect(certificate.expired?).to be true
    end

    it "returns false when the certificate is not expired" do
      certificate = Xolphin::Api::Responses::Certificate.new("dateExpired" => (Date.today + 1).to_s)
      expect(certificate.expired?).to be false
    end
  end
end
