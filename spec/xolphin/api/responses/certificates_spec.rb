require "spec_helper"

describe Xolphin::Api::Responses::Certificates do
  subject do
    data = { "page" => 1, "limit" => 20, "pages" => 1, "total" => 5, "_links" => { "self" => { "href" => "https://test-api.xolphin.com/v1/certificates?page=1" }, "first" => { "href" => "https://test-api.xolphin.com/v1/certificates?page=1" }, "last" => { "href" => "https://test-api.xolphin.com/v1/certificates?page=1" } }, "_embedded" => { "certificates" => [{ "id" => 960000029, "domainName" => "test29.ssl-test.nl", "dateIssued" => "2016-05-23T00:00:00+0200", "dateExpired" => "2017-05-23T00:00:00+0200", "company" => "Xolphin B.V.", "customerId" => nil, "_links" => { "self" => { "href" => "/v1/certificates/960000029" } }, "_embedded" => { "product" => { "id" => 11, "name" => "RapidSSL", "brand" => "GeoTrust", "_links" => { "self" => { "href" => "/v1/products/11" } } } } }] } }
    Xolphin::Api::Responses::Certificates.new(data)
  end

  describe "#certificates" do
    it "returns a list of certificates" do
      expect(subject.certificates.length).to eq(1)
      expect(subject.certificates.first).to be_instance_of(Xolphin::Api::Responses::Certificate)
    end
  end

  describe "pagination" do
    it "returns pagination links in the response" do
      expect(subject.page).to eq(1)
      expect(subject.limit).to eq(20)
      expect(subject.pages).to eq(1)
      expect(subject.total).to eq(5)
    end
  end
end
