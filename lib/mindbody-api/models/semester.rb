module MindBody
  module Models
    class Semester < Base
      attribute :id, Integer
      attribute :start_date, DateTime
      attribute :end_date, DateTime
    end
  end
end
