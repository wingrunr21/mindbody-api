module MindBody
  module Models
    class Availability < Base
      attribute :id, Integer
      attribute :programs, Array[Program]
      attribute :start_date_time, DateTime
      attribute :end_date_time, DateTime
      attribute :bookable_end_date_time, DateTime
    end
  end
end
