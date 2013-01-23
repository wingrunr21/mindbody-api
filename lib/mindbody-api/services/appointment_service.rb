module MindBody
  module Services
    class AppointmentService < Service
      service "AppointmentService"

      operation :get_staff_appointments,    :required => [:staff_credentials]
      operation :get_bookable_items,        :required => [:session_type_ids]
      operation :get_schedule_items
    end
  end
end
