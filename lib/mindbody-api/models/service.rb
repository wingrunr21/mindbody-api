module MindBody
  module Models
    class Service < Base
      attribute :id, Integer
      attribute :price, Float
      attribute :online_price, Float
      attribute :tax_rate, Float
      attribute :product_id, Float #why is this a float?
      attribute :name, String
      attribute :count, Integer
    end
  end
end
