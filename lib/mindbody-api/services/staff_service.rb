module MindBody
  module Services
    class StaffService < Service
      service 'StaffService'

      operation :get_staff
      operation :get_staff_permissions
      operation :add_or_update_staff,     :required => [:staff]
      operation :get_staff_img_url,       :required => [:staffid]
    end
  end
end
