module MindBody
  module Models
    class ClientService < Base
      attribute :id, Integer
      attribute :current, Boolean
      attribute :count, Integer
      attribute :remaining, Integer
      attribute :name, String
      attribute :payment_date, DateTime
      attribute :active_date, DateTime
      attribute :expiration_date, DateTime
      attribute :program, Program
    end
  end
end

