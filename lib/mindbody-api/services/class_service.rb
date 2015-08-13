module MindBody
  module Services
    class ClassService < Service
      service "ClassService"

      operation :get_classes
      operation :get_class_visits,             required:[:class_id]
      operation :get_class_descriptions
      operation :get_class_schedules
      operation :add_clients_to_classes,       required: [:class_ids, :client_ids]
      operation :remove_clients_from_classes,  required: [:class_ids, :client_ids]
    end
  end
end
