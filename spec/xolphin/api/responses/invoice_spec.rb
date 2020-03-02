require "spec_helper"

describe Xolphin::Api::Responses::Invoice do
  subject do
    data = { "id" => 223873, "currency" => "EUR", "amount" => "250.00", "tax" => "52.50", "invoiceNr" => "628960", "amountPaid" => nil, "status" => "Betaald", "total" => "302.50", "date_created" => "2016-05-24T00:00:00+0200", "date_reminder" => "2020-03-02T12:38:33+0100", "date_payed" => "2020-03-02T12:38:33+0100", "_links" => { "self" => { "href" => "/v1/invoices/223873" }, "download" => { "href" => "/v1/invoices/223873/download" } } }
    Xolphin::Api::Responses::Invoice.new(data)
  end

  describe "#id" do
    it "returns the id" do
      expect(subject.id).to eq(223873)
    end
  end

  describe "#currency" do
    it "returns the currency" do
      expect(subject.currency).to eq("EUR")
    end
  end

  describe "#amount" do
    it "returns the amount" do
      expect(subject.amount).to eq("250.00")
    end
  end

  describe "#tax" do
    it "returns the date of tax" do
      expect(subject.tax).to eq("52.50")
    end
  end

  describe "#invoice_number" do
    it "returns the invoice_number" do
      expect(subject.invoice_number).to eq("628960")
    end
  end

  describe "#amount_paid" do
    it "returns the total amount" do
      expect(subject.amount_paid).to eq(nil)
    end
  end

  describe "#status" do
    it "returns the status" do
      expect(subject.status).to eq("Betaald")
    end
  end

  describe "#total" do
    it "returns the total" do
      expect(subject.total).to eq("302.50")
    end
  end

  describe "#date_created" do
    it "returns the date of creation" do
      expect(subject.date_created).to be_instance_of(Time)
      expect(subject.date_created).to eq(Time.parse("2016-05-24T00:00:00+0200"))
    end
  end

  describe "#date_reminder" do
    it "returns the date of reminder" do
      expect(subject.date_reminder).to be_instance_of(Time)
      expect(subject.date_reminder).to eq(Time.parse("2020-03-02T12:38:33+0100"))
    end
  end

  describe "#date_payed" do
    it "returns the date of payment" do
      expect(subject.date_payed).to be_instance_of(Time)
      expect(subject.date_payed).to eq(Time.parse("2020-03-02T12:38:33+0100"))
    end
  end
end
