module MindBody
  module Services
    class SaleService < Service
      service "SaleService"

      operation :get_accepted_card_type,      :locals => false
      operation :get_sales
      operation :checkout_shopping_cart,      :required => [:client_id, :cart_items, :payments]
      operation :get_services
      operation :get_packages
      operation :get_products
      operation :get_custom_payment_methods
    end
  end
end
