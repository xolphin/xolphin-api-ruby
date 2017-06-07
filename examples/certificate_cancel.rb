require_relative "../lib/xolphin/api"
require_relative "credentials"

client = Xolphin::Api::Client.new(Credentials.username, Credentials.password, true)
result = client.certificate.cancel(960003013, 'idk', false);
puts result.inspect