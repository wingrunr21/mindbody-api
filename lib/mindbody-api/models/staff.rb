module MindBody
  module Models
    class Staff < Base
      attribute :id, Integer
      attribute :email, String
      attribute :mobile_phone, String
      attribute :home_phone, String
      attribute :work_phone, String
      attribute :address, String
      attribute :address2, String
      attribute :city, String
      attribute :state, String
      attribute :country, String
      attribute :postal_code, String
      attribute :foreign_zip, String
      attribute :name, String
      attribute :first_name, String
      attribute :last_name, String
    end
  end
end

