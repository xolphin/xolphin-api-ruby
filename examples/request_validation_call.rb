require_relative "../lib/xolphin/api"
require_relative "_credentials.rb"

client = Xolphin::Api::Client.new(Credentials.username, Credentials.password, true)
result = client.request.scheduleValidationCall(963437377, "2024-01-01 13:00", {action: "ScheduledCallback"})
puts result.inspect
