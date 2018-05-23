lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "openaq/version"

Gem::Specification.new do |spec|
  spec.name          = "openaq-client"
  spec.version       = Openaq::VERSION
  spec.authors       = ["Yiorgos Michokostas"]
  spec.email         = ["michokostas@gmail.com"]

  spec.summary       = %q{Ruby client for the OpenAQ API}
  spec.description   =  <<~DESCRIPTION
      openaq-client is a Gem for the openaq.org JSON API
  DESCRIPTION
  spec.license       = "MIT"

  spec.files         = Dir.glob('lib/**/*')
  spec.test_files    = Dir.glob('spec/*')
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 4.0"
  spec.add_development_dependency "webmock", "~> 3.3"
end
