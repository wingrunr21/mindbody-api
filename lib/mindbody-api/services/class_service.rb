module MindBody
  module Services
    class ClassService < Service
      service "ClassService"

      operation :get_classes
      operation :get_class_visits
      operation :get_class_descriptions
    end
  end
end
