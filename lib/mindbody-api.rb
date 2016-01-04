require 'active_support/inflector'
require 'active_support/core_ext/array/extract_options'

require 'mindbody-api/version'
require 'mindbody-api/models'
require 'mindbody-api/service'
require 'mindbody-api/api_status'

module MindBody
  class << self
    def configure
      yield(configuration) if block_given?
    end

    def configuration
      @configuration ||= Config.new
    end
  end

  class Config
    attr_accessor :log_level, :open_timeout, :read_timeout, :source_name, :source_key, :site_ids, :username, :password, :prod_mode

    def initialize
      @log_level = :debug
      @source_name = ENV['MINDBODY_SOURCE_NAME'] || ''
      @source_key = ENV['MINDBODY_SOURCE_KEY'] || ''
      @site_ids = (ENV['MINDBODY_SITE_IDS'] || '').scan(/-?\d+/).map(&:to_i)
      @username = ENV['MINDBODY_USERNAME'] || nil
      @password = ENV['MINDBODY_PASSWORD'] || nil
      @prod_mode = ENV['MINDBODY_PROD_MODE'] || false
    end

    # Make sure site_ids is always an Array
    def site_ids=(ids)
      @site_ids = [*ids]
    end
  end
end
