module MindBody
  module Models
    class Payment < Base
      attribute :id, Integer
      attribute :amount, Float
      attribute :method, Integer
      attribute :type, String
      attribute :notes, String
    end
  end
end
