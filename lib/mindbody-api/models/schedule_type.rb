module MindBody
  module Models
    class ScheduleType < Base
      VALID_TYPES = %w{All DropIn Appointment Enrollment Resource Arrival Media}

      attribute :type, String

      def initialize(t)
        self.type = VALID_TYPES.include?(t) ? t : nil
      end
    end
  end
end
