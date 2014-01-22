module MindBody
  module Models
    class ClassSchedule < Base
      attribute :id, Integer
      attribute :classes, Array[Class]
      attribute :clients, Array[Client]
      attribute :course, Course
      attribute :semester_id, Integer
      attribute :is_available, Boolean
      attribute :class_description, ClassDescription
      attribute :day_sunday, Boolean
      attribute :day_monday, Boolean
      attribute :day_tuesday, Boolean
      attribute :day_wednesday, Boolean
      attribute :day_thursday, Boolean
      attribute :day_friday, Boolean
      attribute :day_saturday, Boolean
      attribute :start_time, Time
      attribute :end_time, Time
      attribute :start_date, Date
      attribute :end_date, Date
      attribute :staff, Staff
      attribute :location, Location
    end
  end
end
