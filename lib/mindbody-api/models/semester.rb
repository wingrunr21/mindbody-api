module MindBody
  module Models
    class Semester < Base
      attribute :id, Integer
      attribute :start_date, Time
      attribute :end_date, Time
    end
  end
end
