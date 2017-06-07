# Xolphin API gem for Ruby
xolphin-api-ruby is a library which allows quick integration of the [Xolphin REST API](https://api.xolphin.com) in Ruby to automated ordering, issuance and installation of SSL Certificates.

## About Xolphin
[Xolphin](https://www.xolphin.nl/) is the largest supplier of [SSL Certificates](https://www.sslcertificaten.nl) and [Digital Signatures](https://www.digitalehandtekeningen.nl) in the Netherlands. Xolphin has
a professional team providing reliable support and rapid issuance of SSL Certificates at an affordable price from industry leading brands such as Comodo, GeoTrust, GlobalSign, Thawte and Symantec.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xolphin-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xolphin-api

## Usage

### Client initialization

```ruby
require 'xolphin/api'

client = Xolphin::Api::Client.new('<username>', '<password>')
```

### Requests

#### Getting list of requests

```ruby
requests = client.request.all
requests.each do |request|
  puts request.id, request.product.id
end
```

#### Getting request by ID

```ruby
request = client.request.get(960000024)
puts request.product.brand
```

#### Requesting certificate

```ruby
ccr = client.request.create(24, 1, 'csr string', Xolphin::Api::DcvType::EMAIL)
ccr.address = 'Address'
ccr.approver_first_name = 'FirstName'
ccr.approver_last_name = 'LastName'
ccr.approver_phone = '+12345678901'
ccr.approver_email = 'email@domain.com'
ccr.zipcode = '123456'
ccr.city = 'City'
ccr.company = 'Company'
ccr.subject_alternative_names = ['test1.domain.com', 'test2.domain.com']
ccr.dcv = [{
  'domain' => 'test1.domain.com',
  'dcvType' => Xolphin::Api::DcvType::EMAIL,
  'approverEmail' => 'email@domain.com'
}]

request = client.request.send(ccr)
puts request.id
```

#### Reissue certificate

```ruby
certificate = client.certificate.get(<certificate_id>);
request = Xolphin::Api::CertificateRequests::ReissueCertificateRequest.new(<csr_string>,"EMAIL")
client.certificate.reissue(certificate.id, request)
```

#### Renew certificate

```ruby
certificate = client.certificate.get(<certificate_id>);
request = Xolphin::Api::CertificateRequests::RenewCertificateRequest.new(certificate.product.id, <years>, <csr_string>, 'FILE')
client.certificate.renew(certificate.id, request)
```

#### Create a note

```ruby
result = client.request.sendNote(1234, 'message')
```

#### Get list of notes

```ruby
result = client.request.getNotes(1234)
result.notes.each do |note|
  puts note.message_body, note.created_at
end
```

#### Send a "Comodo Subscriber Agreement" email

```ruby
# currently available languages: en, de, fr, nl
result = client.request.sendComodoSAEmail(1234, 'email@example.com', '<language>');
```

#### Request an "Encryption Everywhere" certificate
```ruby
request = client.request.createEE
request.csr = "<csr_string>"
request.approver_first_name = "FirstName"
request.approver_last_name = "LastName"
request.approver_phone = "+1234567890"
request.approver_email = "email@domain.com"
request.subject_alternative_names = ["test1.domain.com", "test2.domain.com"]
request.dcv_type = "FILE"
response = client.request.sendEE(request)
```

### Certificate

#### Certificates list and expirations

```ruby
certificates = client.certificate.all
certificates.each do |certificate|
  puts certificate.id, certificate.expired?
end
```

#### Download certificate

```ruby
certificate = client.certificate.download(960000031, Xolphin::Api::FormatType::CRT)
File.write('crt.crt', certificate)
```

### Support

#### Products list

```ruby
products = client.support.products
products.each do |product|
  puts product.id, product.brand
end
```

#### Decode CSR

```ruby
data = client.support.decode_csr('csr string')
puts data.type, data.size
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/xolphin/xolphin-api-ruby.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
