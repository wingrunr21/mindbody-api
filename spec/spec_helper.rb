require 'bundler/setup'
require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'mindbody-api'

RSpec.configure do |config|
  config.color = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# Load custom matchers
Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}
