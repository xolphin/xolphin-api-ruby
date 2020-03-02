require_relative "../lib/xolphin/api"

client = Xolphin::Api::Client.new(Credentials.username, Credentials.password, true)
invoices = client.invoice.all
invoices.each do |invoice|
  puts invoice.id, invoice.amount
end
