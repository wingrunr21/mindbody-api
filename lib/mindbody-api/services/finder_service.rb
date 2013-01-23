module MindBody
  module Services
    class FinderService < Service
      service 'FinderService'

      operation :get_classes_within_radius,            :required => [:search_latitude, :search_longitude, :search_radius]
      operation :get_session_types_within_radius,      :required => [:search_latitude, :search_longitude, :search_radius]
      operation :get_business_locations_within_radius, :required => [:search_latitude, :search_longitude, :search_radius]
    end
  end
end
