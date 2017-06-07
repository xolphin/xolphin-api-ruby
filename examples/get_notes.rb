require_relative "../lib/xolphin/api"
require_relative "_credentials"

client = Xolphin::Api::Client.new(Credentials.username, Credentials.password, true)
result = client.request.getNotes(960003015)
puts result.inspect
result.notes.each do |note|
  puts note.message_body, note.created_at
end