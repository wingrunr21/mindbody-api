module MindBody
  module Services
    class ClassService < Service
      service "ClassService"

      operation :get_classes
      operation :get_class_visits,             required:[:class_id]
      operation :get_class_descriptions
      operation :get_class_schedules
      operation :get_waitlist_entries,         required: [:class_ids]
      operation :add_clients_to_classes,       required: [:class_ids, :client_ids]
      operation :remove_clients_from_classes,  required: [:class_ids, :client_ids]
      operation :update_client_visits,         required: [:visits]
    end
  end
end
