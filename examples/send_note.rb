require_relative "../lib/xolphin/api"
require_relative "_credentials"

client = Xolphin::Api::Client.new(Credentials.username, Credentials.password, true)
result = client.request.sendNote(960003015, 'note')
puts result.inspect