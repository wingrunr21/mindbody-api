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

  class Config < OpenStruct

    def initialize()
      defaults = 
      {
        log_level: :debug,
        source_name:  ENV['MINDBODY_SOURCE_NAME'] || '',
        source_key: ENV['MINDBODY_SOURCE_KEY'] || '',
        site_ids: (ENV['MINDBODY_SITE_IDS'] || '').scan(/-?\d+/).map(&:to_i),
        filters: ['Password']
      }
      super(defaults)
      # Override site_id  to make sure its always an array
      define_singleton_method("site_ids=") { |x| modifiable[:site_ids] = [*x] }
    end
  end
end
