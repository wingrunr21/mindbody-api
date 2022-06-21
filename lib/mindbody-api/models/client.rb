module MindBody
  module Models
    class Client < Base
      attribute :id, String
      attribute :unique_id, Integer
      attribute :first_name, String
      attribute :last_name, String
      attribute :gender, String
      attribute :account_balance, Float
      attribute :email, String
      attribute :email_opt_in, Boolean
      attribute :address_line1, String
      attribute :address_line2, String
      attribute :city, String
      attribute :state, String
      attribute :postal_code, String
      attribute :country, String
      attribute :birth_date, Date
      attribute :home_location, Location
      attribute :is_prospect, Boolean
      attribute :is_company, Boolean
      attribute :notes, String
      attribute :mobile_phone, String
      attribute :home_phone, String
      attribute :photo_url, String
      attribute :username, String
      attribute :referred_by, String
      attribute :promotional_email_opt_in, Boolean
      attribute :first_appointment_date, DateTime
      attribute :emergency_contact_info_name, String
      attribute :emergency_contact_info_relationship, String
      attribute :emergency_contact_info_phone, String
      attribute :emergency_contact_info_email, String

      def name
        "#{first_name} #{last_name}"
      end
    end
  end
end
