module MindBody
  module Models
    class Site < Base
      attribute :id, Integer
      attribute :name, String
      attribute :description, String
      attribute :logo_url, String
      attribute :page_color1, String
      attribute :page_color2, String
      attribute :page_color3, String
      attribute :page_color4, String
      attribute :accepts_visa, Boolean
      attribute :accepts_discover, Boolean
      attribute :accepts_master_card, Boolean
      attribute :accepts_american_express, Boolean
      attribute :contact_email, String

      def page_colors
        (1..4).collect {|i| self.send("page_color#{i}")}
      end
    end
  end
end
