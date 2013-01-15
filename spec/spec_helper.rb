require 'bundler/setup'
require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'mindbody-api'
require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.color = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# Load custom matchers
Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}
