module MindBody
  module Models
    class SaleItem < Base
      attribute :sale, Sale
      attribute :description, String
      attribute :price, Float
      attribute :amount_paid, Float
      attribute :discount, Float
      attribute :tax, Float
      attribute :returned, Boolean
      attribute :quantity, Integer
    end
  end
end
