require "spec_helper"

describe Xolphin::Api::Responses::Product do
  subject do
    data = { "id" => 90, "brand" => "Comodo", "name" => "EssentialSSL", "type" => "SINGLE", "validation" => "DV", "prices" => [{ "years" => 1, "price" => "8.00" }, { "years" => 2, "price" => "14.00" }, { "years" => 3, "price" => "20.00" }], "_links" => { "self" => { "href" => "/v1/products/90" } } }
    Xolphin::Api::Responses::Product.new(data)
  end

  describe "#prices" do
    it "returns a list of prices" do
      expect(subject.prices.length).to eq(3)
      expect(subject.prices.first).to be_instance_of(Xolphin::Api::Responses::ProductPrice)
    end
  end

  describe "#id" do
    it "returns the product id" do
      expect(subject.id).to eq(90)
    end
  end

  describe "#brand" do
    it "returns the product brand" do
      expect(subject.brand).to eq("Comodo")
    end
  end

  describe "#name" do
    it "returns the product name" do
      expect(subject.name).to eq("EssentialSSL")
    end
  end

  describe "#type" do
    it "returns the product type" do
      expect(subject.type).to eq("SINGLE")
    end
  end

  describe "#validation" do
    it "returns the product validation type" do
      expect(subject.validation).to eq("DV")
    end
  end

  describe "#included_domains" do
    it "returns the included_domains setting" do
      expect(subject.included_domains).to be nil
    end
  end

  describe "#max_domains" do
    it "returns the max_domains setting" do
      expect(subject.max_domains).to be nil
    end
  end
end
