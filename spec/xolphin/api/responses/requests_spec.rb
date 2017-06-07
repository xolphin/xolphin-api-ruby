require "spec_helper"

describe Xolphin::Api::Responses::Requests do
  subject do
    data = { "page" => 1, "limit" => 20, "pages" => 2, "total" => 24, "_links" => { "self" => { "href" => "https://test-api.xolphin.com/v1/requests?page=1" }, "first" => { "href" => "https://test-api.xolphin.com/v1/requests?page=1" }, "last" => { "href" => "https://test-api.xolphin.com/v1/requests?page=2" }, "next" => { "href" => "https://test-api.xolphin.com/v1/requests?page=2" } }, "_embedded" => { "requests" => [{ "id" => 960000024, "domainName" => "test24.ssl-test.nl", "company" => "Xolphin B.V.", "dateOrdered" => "2016-05-23T10:54:42+0200", "validations" => { "organization" => { "status" => true }, "whois" => { "status" => true }, "docs" => { "status" => true }, "phone" => { "status" => true }, "dcv" => { "status" => false } }, "requiresAction" => false, "_links" => { "self" => { "href" => "/v1/requests/960000024" } }, "_embedded" => { "product" => { "id" => 41, "name" => "EV", "brand" => "Comodo", "_links" => { "self" => { "href" => "/v1/products/41" } } } } }] } }
    Xolphin::Api::Responses::Requests.new(data)
  end

  describe "#requests" do
    it "returns a list of requests" do
      expect(subject.requests.length).to eq(1)
      expect(subject.requests.first).to be_instance_of(Xolphin::Api::Responses::Request)
    end
  end

  describe "pagination" do
    it "returns pagination links in the response" do
      expect(subject.page).to eq(1)
      expect(subject.limit).to eq(20)
      expect(subject.pages).to eq(2)
      expect(subject.total).to eq(24)
    end
  end
end
