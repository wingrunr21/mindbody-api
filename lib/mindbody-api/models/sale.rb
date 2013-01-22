module MindBody
  module Models
    class Sale < Base
      attribute :id, Integer
      attribute :sale_date_time, DateTime
      attribute :location, Location
      attribute :payments, Array[Payment]
    end
  end
end
