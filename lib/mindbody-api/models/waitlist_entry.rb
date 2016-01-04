module MindBody
  module Models
    class WaitlistEntry < Base
      attribute :id, Integer
      attribute :class_id, Integer
      attribute :class_date, DateTime
      attribute :client, Client
      attribute :class_schedule, ClassSchedule
    end
  end
end