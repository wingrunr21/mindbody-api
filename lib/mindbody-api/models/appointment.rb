module MindBody
  module Models
    class Appointment < Base
      attribute :id, Integer
      attribute :status, AppointmentStatus
      attribute :start_date_time, DateTime
      attribute :end_date_time, DateTime
      attribute :notes, String
      attribute :staff_requested, Boolean
      attribute :program, Program
      attribute :session_type, SessionType
      attribute :location, Location
      attribute :staff, Staff
      attribute :client, Client
      attribute :first_appointment, Boolean
      attribute :client_service, ClientService
      attribute :resources, Array[Resource]
      attribute :gender_preference, String
      attribute :duration, Integer
    end
  end
end
