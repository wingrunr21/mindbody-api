module MindBody
  module Services
    class ClassService < Service
      service "ClassService"

      operation :get_classes
      operation :get_class_visits,           required:[:class_id]
      operation :get_class_descriptions
      operation :get_class_schedules
      operation :update_client_visits
      operation :get_enrollments
      operation :add_clients_to_classes
      operation :remove_clients_from_classes
      operation :add_clients_to_enrollments
      operation :remove_from_waitlist
      operation :get_semesters
      operation :get_courses
      operation :get_waitlist_entries
    end
  end
end
