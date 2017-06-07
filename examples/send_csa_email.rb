require_relative "../lib/xolphin/api"

client = Xolphin::Api::Client.new(Credentials.username, Credentials.password, true)
result = client.request.sendComodoSAEmail(960003013, 'nikita@xolphin.nl');
puts result.inspect