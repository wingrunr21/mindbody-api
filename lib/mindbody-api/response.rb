module MindBody
  module Services
    class Response
      attr_reader :response, :result, :status, :error_code, :xml_detail,
                  :result_count, :current_page_index, :total_page_count,
                  :remote_method, :message, :api_status

      def initialize(res)
        @response = res
        @result = {}
        normalize_response
        @api_status = APIStatus.build_status(error_code, status, message)
      end

      # Delegate methods to the @response object
      def method_missing(method, *args, &blk)
        if @response.respond_to?(method)
          self.class.send(:define_method, method) do |*args, &blk|
            @response.send(method, *args, &blk)
          end
          self.send(method)
        else
          super
        end
      end

      def respond_to?(method, include_private = false)
        super || @response.respond_to?(method)
      end

      private
      def normalize_response
        # All responses come back nested in a CallingMethodResponse
        # and then a CallingMethodResult. Strip these two parents
        # so we can get at the meat of the result. This is a naive
        # strip
        result = @response.to_hash
        result = result.flatten.last.flatten[1]

        result = normalize_hash(result)

        # Loop over result. If we respond to a key of the response, consume it,
        # otherwise build the result hash
        @result.clear
        result.each_pair do |key, value|
          if self.respond_to?(key) && key != :class
            self.instance_variable_set("@#{key}", value)
          else
            @result[key] = constantize_key(key, value)
          end
        end
      end

      # Recursively iterate over the hash and perform
      # a number of optimizations:
      #
      #   * Sometimes data comes back like this:
      #     things => {
      #       thing => [thing1, thing2, thing3]
      #     }
      #
      #     Map this pattern to be like this:
      #     things => [thing1, thing2, thing3, ...
      def normalize_hash(hash)
        hash.each_pair do |key, value|
          if value.is_a? Hash
            hash[key] = normalize_hash(value)

            key_singular = map_key(key).singularize.to_sym

            if value.has_key?(key_singular)
              hash[key] = value[key_singular]
            elsif value.has_key?(:string)
              hash[key] = value[:string]
            elsif value.has_key?(:int)
              hash[key] = value[:int]
            end
          elsif value.is_a? Array
            value.map! do |i|
              i.is_a?(Hash) ? normalize_hash(i) : i
            end
          end
        end

        return hash
      end

      def constantize_key(key, value)
        begin
          klass_s = map_key(key).classify
          klass = "MindBody::Models::#{klass_s}".constantize

          # Make sure we return a properly mapped array if needed
          value.is_a?(Array) ? value.map {|v| klass.new(v)} : klass.new(value) unless value.nil?
        rescue
          value
        end
      end

      # We have some keys that need
      # to be mapped to others so that classify works properly.
      #
      # We cannot use inflector to do this because some words are popular
      # enough to stomp on people's namespaces
      def map_key(key)
        case key
        when :staff_members, :organizer
          'staff'
        when :purchases
          'sale_item'
        when :image_url, :mobile_image_url
          'string'
        else
          key.to_s
        end
      end
    end
  end
end
