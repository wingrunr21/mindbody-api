module MindBody
  module Services
    class DataService < Service
      service 'DataService'

      operation :select_data_xml,   :required => [:select_sql],   :locals => false
      operation :select_data_csv,   :required => [:select_sql],   :locals => false
      operation :select_aggregate_data_xml,   :required => [:select_sql],   :locals => false
      operation :select_aggregate_data_csv,   :required => [:select_sql],   :locals => false
    end
  end
end
