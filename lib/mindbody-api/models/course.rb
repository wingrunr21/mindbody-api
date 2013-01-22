module MindBody
  module Models
    class Course < Base
      attribute :id, Integer
      attribute :name, String
      attribute :description, String
      attribute :notes, String
      attribute :start_date, DateTime
      attribute :end_date, DateTime
      attribute :location, Location
      attribute :organizer, Staff
      attribute :program, Program
      attribute :image_url, String
    end
  end
end
