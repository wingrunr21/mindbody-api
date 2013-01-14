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
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec', '~> 2.12.0'
  gem.add_development_dependency 'webmock', '~> 1.9.0'
  gem.add_development_dependency 'vcr', '~> 2.4.0'
end
