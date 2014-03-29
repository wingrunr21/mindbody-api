module MindBody
  module Models
    class Class < Base
      attribute :id, Integer
      attribute :class_schedule_id, Integer
      attribute :visits, Array[Visit]
      attribute :clients, Array[Client]
      attribute :location, Location
      attribute :max_capacity, Integer
      attribute :web_capacity, Integer
      attribute :total_booked, Integer
      attribute :web_booked, Integer
      attribute :semester_id, Semester
      attribute :is_canceled, Boolean
      attribute :substitute, Boolean
      attribute :active, Boolean
      attribute :is_waitlist_available, Boolean
      attribute :is_enrolled, Boolean
      attribute :hide_cancel, Boolean
      attribute :is_available, Boolean
      attribute :start_date_time, DateTime
      attribute :end_date_time, DateTime
      attribute :class_description, ClassDescription
      attribute :staff, Staff

      def name
        class_description.name
      end
    end
  end
end
