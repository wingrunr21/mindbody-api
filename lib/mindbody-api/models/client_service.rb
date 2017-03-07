module MindBody
  module Models
    class ClientService < Base
      attribute :id, Integer
      attribute :current, Boolean
      attribute :count, Integer
      attribute :remaining, Integer
      attribute :name, String
      attribute :payment_date, Time
      attribute :active_date, Time
      attribute :expiration_date, Time
      attribute :program, Program
    end
  end
end

