require 'httpclient'
require 'savon'
require 'mindbody-api/client'
require 'mindbody-api/ext/savon_ext'

module MindBody
  module Services
    class Service
      extend Savon::Model

      WSDL_PATH = File.expand_path(File.join(__FILE__, '..', '..', '..', 'wsdl', '%s.wsdl'))

      class << self
        def service(name)
          @wsdl = WSDL_PATH % name.to_s
          client :wsdl => @wsdl
        end

        def client(globals = {})
          @client ||= Client.new(globals)
        end

        def operation(name, *opts)
          define_class_operation(name, *opts)
          define_instance_operation(name, *opts)
        end

        include MindBody::SavonExt::Service
      end
    end
  end
end
