# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doldata_sdk/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby_doldata_sdk'
  spec.version       = DolDataSDK::VERSION
  spec.authors       = ['Giridhar Bandi']
  spec.email         = ['giridhar dot bandi dot r at dol dot gov']

  spec.summary       = %q{Ruby SDK to ease access to DOL's and other federal agencies' APIs. }
  spec.description   = %q{Ruby SDK to ease access to DOL's and other federal agencies' APIs. }
  spec.homepage      = 'http://developer.dol.gov'
  spec.license       = 'MIT'

  spec.files = Dir['lib/**/*.rb']

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 2.3'
  spec.add_dependency 'httparty', '~>0.14'
  spec.add_dependency 'figaro', '~>1.1'
end
