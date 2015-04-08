# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mindbody-api/version'

Gem::Specification.new do |gem|
  gem.name          = "mindbody-api"
  gem.version       = MindBody::VERSION
  gem.authors       = ["Stafford Brunk"]
  gem.email         = ["stafford.brunk@gmail.com"]
  gem.description   = %q{A Ruby interface for the MindBody API}
  gem.summary       = %q{This gem provides a Ruby interface for the MindBody API in both a services format and a 'Rails-style' format}
  gem.homepage      = "http://wingrunr21.github.io/mindbody-api/"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'savon', '~> 2.11.0'
  gem.add_dependency 'virtus', '~> 1.0.0'
  gem.add_dependency 'activesupport', '>= 3.2.11'

  gem.add_development_dependency 'rspec', '~> 2.14.0'
  gem.add_development_dependency 'simplecov', '~> 0.8.2'
  gem.add_development_dependency 'guard-rspec', '~> 4.2.8'
  gem.add_development_dependency 'rake', '~> 10.0.3'
end
