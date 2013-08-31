module MindBody
  module Models
    class ClientCreditCard < Base
      attribute :card_number, String
      attribute :card_holder, String
      attribute :city, String
      attribute :address, String
      attribute :state, String
      attribute :postal_code, String
      attribute :exp_month, String
      attribute :exp_year, Integer
      
      
    end
  end
end
    
