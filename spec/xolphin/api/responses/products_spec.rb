require "spec_helper"

describe Xolphin::Api::Responses::Products do
  subject do
    data = { "page" => 1, "limit" => 20, "pages" => 4, "total" => 69, "_links" => { "self" => { "href" => "https://test-api.xolphin.com/v1/products?page=1" }, "first" => { "href" => "https://test-api.xolphin.com/v1/products?page=1" }, "last" => { "href" => "https://test-api.xolphin.com/v1/products?page=4" }, "next" => { "href" => "https://test-api.xolphin.com/v1/products?page=2" } }, "_embedded" => { "products" => [{ "id" => 6, "brand" => "Comodo", "name" => "InstantSSL Test", "type" => "SINGLE", "validation" => "OV", "prices" => [{ "years" => 0, "price" => "0.00" }], "_links" => { "self" => { "href" => "/v1/products/6" } } }] } }
    Xolphin::Api::Responses::Products.new(data)
  end

  describe "#products" do
    it "returns a list of products" do
      expect(subject.products.length).to eq(1)
      expect(subject.products.first).to be_instance_of(Xolphin::Api::Responses::Product)
    end
  end

  describe "pagination" do
    it "returns pagination links in the response" do
      expect(subject.page).to eq(1)
      expect(subject.limit).to eq(20)
      expect(subject.pages).to eq(4)
      expect(subject.total).to eq(69)
    end
  end
end
