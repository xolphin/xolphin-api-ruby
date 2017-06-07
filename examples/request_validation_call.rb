require_relative "../lib/xolphin/api"

client = Xolphin::Api::Client.new(Credentials.username, Credentials.password, true)
result = client.request.scheduleValidationCall(960002992, "2017-05-01 13:00")
puts result.inspect