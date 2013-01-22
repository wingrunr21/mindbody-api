module MindBody
  module Models
    class ClassDescription < Base
      attribute :level, Level
      attribute :id, Integer
      attribute :name, String
      attribute :description, String
      attribute :notes, String
      attribute :last_updated, String
      attribute :program, Program
      attribute :session_type, SessionType
    end
  end
end
