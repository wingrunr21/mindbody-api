require 'virtus'

module MindBody
  module Models
    class Base
      include Virtus.model
    end
  end
end

require 'mindbody-api/models/location'
require 'mindbody-api/models/client'
require 'mindbody-api/models/schedule_type'
require 'mindbody-api/models/program'
require 'mindbody-api/models/client_service'
require 'mindbody-api/models/site'
require 'mindbody-api/models/availability'
require 'mindbody-api/models/unavailability'
require 'mindbody-api/models/staff'
require 'mindbody-api/models/visit'
require 'mindbody-api/models/semester'
require 'mindbody-api/models/course'
require 'mindbody-api/models/level'
require 'mindbody-api/models/session_type'
require 'mindbody-api/models/class_description'
require 'mindbody-api/models/class'
require 'mindbody-api/models/class_schedule'
require 'mindbody-api/models/payment'
require 'mindbody-api/models/sale'
require 'mindbody-api/models/sale_item'
require 'mindbody-api/models/service'
require 'mindbody-api/models/resource'
require 'mindbody-api/models/appointment_status'
require 'mindbody-api/models/appointment'
