module MindBody
  module Services
    class ClassService < Service
      service "ClassService"

      operation :add_clients_to_classes
      operation :get_classes
      operation :get_class_visits,           required:[:class_id]
      operation :get_class_descriptions
      operation :get_class_schedules
      operation :remove_clients_from_classes
    end
  end
end
