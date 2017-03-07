module MindBody
  module Models
    class Course < Base
      attribute :id, Integer
      attribute :name, String
      attribute :description, String
      attribute :notes, String
      attribute :start_date, Time
      attribute :end_date, Time
      attribute :location, Location
      attribute :organizer, Staff
      attribute :program, Program
      attribute :image_url, String
    end
  end
end
