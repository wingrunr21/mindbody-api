module MindBody
  module Models
    class AppointmentStatus < Base
      VALID_STATUS = %w{Booked Completed Confirmed Arrived NoShow Cancelled}

      attribute :status, String

      def initialize(s)
        self.status = VALID_STATUS.include?(s) ? s : nil
      end
    end
  end
end
