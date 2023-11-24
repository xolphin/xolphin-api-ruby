require_relative "../lib/xolphin/api"
require_relative "_credentials"

client = Xolphin::Api::Client.new(Credentials.username, Credentials.password, false)
requests = client.request.all
requests.each do |request|
  puts request.id, request.product.id
end
