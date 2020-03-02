require_relative "../lib/xolphin/api"

client = Xolphin::Api::Client.new(Credentials.username, Credentials.password, true)
requests = client.request.all
requests.each do |request|
  puts request.id, request.product.id
end
