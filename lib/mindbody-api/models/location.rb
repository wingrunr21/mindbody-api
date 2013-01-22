module MindBody
  module Models
    class Location < Base
      attribute :id, Integer
      attribute :business_id, Integer
      attribute :site_id, Integer
      attribute :business_description, String
      attribute :additional_image_ur_ls, Array[String]
      attribute :facility_square_feet, Integer
      attribute :treatment_rooms, Integer
      attribute :pro_spa_finder_site, Boolean
      attribute :has_classes, Boolean
      attribute :phone_extension, String
      attribute :name, String
      attribute :address, String
      attribute :address2, String
      attribute :tax1, Float
      attribute :tax2, Float
      attribute :tax3, Float
      attribute :tax4, Float
      attribute :tax5, Float
      attribute :phone, String
      attribute :city, String
      attribute :state_prov_code, String
      attribute :postal_code, String
      attribute :latitude, Float
      attribute :longitude, Float
      attribute :distance_in_miles, Float
      attribute :image_url, String
      attribute :description, String
      attribute :has_site, Boolean
      attribute :can_book, Boolean

      # No idea why it puts an underscore there
      alias :additional_image_urls :additional_image_ur_ls
    end
  end
end
