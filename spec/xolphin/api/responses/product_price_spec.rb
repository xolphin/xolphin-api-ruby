require "spec_helper"

describe Xolphin::Api::Responses::ProductPrice do
  subject do
    data = { "years" => 1, "price" => "8.00" }
    Xolphin::Api::Responses::ProductPrice.new(data)
  end

  describe "#years" do
    it "returns the number of years" do
      expect(subject.years).to eq(1)
    end
  end

  describe "#price" do
    it "returns the price" do
      expect(subject.price).to eq("8.00")
    end
  end

  describe "#extra_price" do
    it "returns the extra price" do
      expect(subject.extra_price).to be nil
    end
  end

  describe "#extra_price_wildcard" do
    it "returns the extra price for wildcard" do
      expect(subject.extra_price_wildcard).to be nil
    end
  end
end
