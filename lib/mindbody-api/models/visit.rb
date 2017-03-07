module MindBody
  module Models
    class Visit < Base
      attribute :id, Integer
      attribute :class_id, Integer
      attribute :start_date_time, Time
      attribute :end_date_time, Time
      attribute :name, String
      attribute :staff, Staff
      attribute :location, Location
      attribute :client, Client
      attribute :web_signup, Boolean
      attribute :signed_in, Boolean
      attribute :make_up, Boolean
      attribute :service, ClientService
    end
  end
end

