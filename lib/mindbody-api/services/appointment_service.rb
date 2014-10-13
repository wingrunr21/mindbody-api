module MindBody
  module Services
    class AppointmentService < Service
      service "AppointmentService"

      operation :get_staff_appointments,       :required => [:staff_credentials]
      operation :get_bookable_items,           :required => [:session_type_ids]
      operation :get_schedule_items
      operation :add_or_update_appointments,   :required => [:appointments]
      operation :add_or_update_availabilities, :required => [:user_credentials, :start_date_time, :end_date_time, :unavailable_description]
    end
  end
end
