module MindBody
  module SavonExt
    module Service
      private
      # Defines a class-level SOAP operation.
      def define_class_operation(operation, *options)
        options = options.extract_options!
        params = prepare_params(options)

        class_operation_module.module_eval <<-RUBY_EVAL, __FILE__, __LINE__+1
          def #{operation.to_s.snakecase}(#{params.join(',')})
            req_hash = {
              #{params.select{|p| p != 'locals = {}'}
                      .map{|p| "'#{params_key(p)}' => #{p}"}
                      .join(',')}
            }
            locals ||= {}
            client.call #{operation.inspect}, :message => locals.merge(req_hash)
          end
        RUBY_EVAL
      end

      # Defines an instance-level SOAP operation.
      # Defers to the class-level operation
      def define_instance_operation(operation, *options)
        options = options.extract_options!
        params = prepare_params(options)

        instance_operation_module.module_eval <<-RUBY_EVAL, __FILE__, __LINE__+1
          def #{operation.to_s.snakecase}(#{params.join(',')})
            self.class.#{operation.to_s.snakecase} #{params.join(',').chomp(' = {}')}
          end
        RUBY_EVAL
      end

      # Builds the array of params the
      # generated method will utilize
      def prepare_params(options)
        params = options[:required] || []
        params = params.map {|p| p.to_s.snakecase}
        params.push 'locals = {}' if options[:locals].nil? || options[:locals]
        params
      end

      # Maps the snakecase key to the
      # correct MindBody upper case
      def params_key(k)
        key = k.to_s.camelize
        key.gsub('Id', 'ID')
      end
    end
  end
end
