# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xolphin/api/version'

Gem::Specification.new do |spec|
  spec.name          = "xolphin-api"
  spec.version       = Xolphin::Api::VERSION
  spec.authors       = ["Kentaa"]
  spec.email         = ["support@kentaa.nl"]

  spec.summary       = "Xolphin API module for Ruby"
  spec.homepage      = "https://xolphin.nl/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
