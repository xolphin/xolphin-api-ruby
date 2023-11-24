require_relative "../lib/xolphin/api"
require_relative "_credentials.rb"

client = Xolphin::Api::Client.new(Credentials.username, Credentials.password, false)
result = client.request.get(963437363)
puts result.inspect
