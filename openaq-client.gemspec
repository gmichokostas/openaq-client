lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'openaq/version'

Gem::Specification.new do |spec|
  spec.name          = 'openaq-client'
  spec.version       = Openaq::VERSION
  spec.authors       = ['Yiorgos Michokostas']
  spec.email         = ['michokostas@gmail.com']

  spec.summary       = %q{Ruby client for the OpenAQ API}
  spec.description   =  <<~DESCRIPTION
    openaq-client is a Gem for the openaq.org JSON API
  DESCRIPTION
  spec.homepage      = 'https://github.com/gmichokostas/openaq-client'
  spec.license       = 'MIT'

  spec.files         = Dir.glob('lib/**/*')
  spec.test_files    = Dir.glob('spec/*')
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.1.4'
  spec.add_development_dependency 'rake',    '~> 13.0.1'
  spec.add_development_dependency 'rspec',   '~> 3.9.0'
  spec.add_development_dependency 'vcr',     '~> 6.0.0'
  spec.add_development_dependency 'webmock', '~> 3.8.3'
end
