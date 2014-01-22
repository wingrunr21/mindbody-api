module MindBody
  module Services
    class ClassService < Service
      service "ClassService"

      operation :get_classes
      operation :get_class_visits,           required:[:class_id]
      operation :get_class_descriptions
      operation :get_class_schedules
    end
  end
end
