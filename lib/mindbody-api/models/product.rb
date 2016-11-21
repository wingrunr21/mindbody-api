module MindBody
  module Models
    class Product < Base
      attribute :id, Integer
      attribute :price, Float
      attribute :online_price, Float
      attribute :tax_rate, Float
      attribute :group_id, Integer
      attribute :name, String
      attribute :long_desc, String
      attribute :color, Hash
      attribute :size, Hash
    end
  end
end