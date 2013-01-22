module MindBody
  module Models
    class ScheduleType < Base
      VALID_TYPES = %w{All DropIn Appointment Enrollment Resource Arrival Media}

      attribute :type, String

      def initialize(type)
        return nil unless VALID_TYPES.include?(type)
        super(:type => type)
      end
    end
  end
end
