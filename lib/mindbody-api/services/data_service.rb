module MindBody
  module Services
    class DataService < Service
      service "DataService"

      operation :function_data_xml, :required => [:function_name, :function_params]
    end
  end
end
