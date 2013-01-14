require 'bundler/setup'
require 'mindbody-api'
require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |c|
  c.color = true
  c.treat_symbols_as_metadata_keys_with_true_values = true
end
