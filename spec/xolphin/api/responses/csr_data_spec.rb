require "spec_helper"

describe Xolphin::Api::Responses::CsrData do
  subject do
    data = { "cn" => "www.test.nl", "country" => "NL", "state" => "", "city" => "", "company" => "", "size" => 2048, "type" => "RSA", "altNames" => [] }
    Xolphin::Api::Responses::CsrData.new(data)
  end

  describe "#type" do
    it "returns the key type" do
      expect(subject.type).to eq("RSA")
    end
  end

  describe "#size" do
    it "returns the key size" do
      expect(subject.size).to eq(2048)
    end
  end

  describe "#company" do
    it "returns the company name" do
      expect(subject.company).to eq("")
    end
  end

  describe "#cn" do
    it "returns the common name" do
      expect(subject.cn).to eq("www.test.nl")
    end
  end

  describe "#state" do
    it "returns the state" do
      expect(subject.state).to eq("")
    end
  end

  describe "#city" do
    it "returns the city" do
      expect(subject.city).to eq("")
    end
  end

  describe "#country" do
    it "returns the country" do
      expect(subject.country).to eq("NL")
    end
  end

  describe "#alt_names" do
    it "returns the alternative names" do
      expect(subject.alt_names).to be_empty
    end
  end
end
