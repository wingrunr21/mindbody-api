require 'mindbody-api/response'

module MindBody
  module Services
    class Client < Savon::Client

      def call(operation_name, locals = {}, &block)
        # Inject the auth params into the request and setup the
        # correct request structure
        @globals.open_timeout(MindBody.configuration.open_timeout)
        @globals.read_timeout(MindBody.configuration.read_timeout)
        @globals.log_level(MindBody.configuration.log_level)

        auth = locals[:auth]
        locals.delete(:auth)

        locals = locals.has_key?(:message) ? locals[:message] : locals
        locals = fixup_locals(locals)
        params = {:message => {'Request' => auth_params(auth).merge(locals)}}

        # Run the request
        response = super(operation_name, params, &block)
        Response.new(response)
      end

      private
      def auth_params(auth = nil)
        auth ||= 
          {
            :source_name => MindBody.configuration.source_name,
            :source_key => MindBody.configuration.source_key,
            :username => MindBody.configuration.username,
            :password => MindBody.configuration.password,

            :site_ids => MindBody.configuration.site_ids
          }

        params = 
          {
            'SourceCredentials' => {
             'SourceName' => auth[:source_name],
             'Password' => auth[:source_key],
             'SiteIDs' => {
               'int' => auth[:site_ids]
              }
            }
          }

        if (auth[:username] && auth[:password])
          params['UserCredentials'] = 
            {
              'Username' => auth[:username],
              'Password' => auth[:password],
              'SiteIDs' => {
               'int' => auth[:site_ids]
              }
            }
        end

        params.merge!({"Test" => true}) unless MindBody.configuration.prod_mode
        params
      end

      def fixup_locals(locals)
        # TODO this needs fixed to support various list types
        locals.each_pair do |key, value|
          if value.is_a? Array
            locals[key] = {'int' => value}
          end
        end
      end
    end
  end
end
