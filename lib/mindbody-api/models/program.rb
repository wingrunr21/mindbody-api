module MindBody
  module Models
    class Program < Base
      attribute :id, Integer
      attribute :name, String
      attribute :schedule_type, ScheduleType
      attribute :cancel_offset, Integer
    end
  end
end
