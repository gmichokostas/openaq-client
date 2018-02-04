
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "openaq/client/version"

Gem::Specification.new do |spec|
  spec.name          = "openaq-client"
  spec.version       = Openaq::VERSION
  spec.authors       = ["George Michokostas"]
  spec.email         = ["michokostas@gmail.com"]

  spec.summary       = %q{Ruby client for the OpenAQ API}
  spec.description   =  <<~DESCRIPTION
      openaq-client is a Gem to wrap openaq.org JSON API
  DESCRIPTION
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 4.0"
  spec.add_development_dependency "webmock", "~> 3.3"
end
