module MindBody
  module APIStatus
    class Base
      attr_accessor :message

      def initialize(message = '')
        @message = message
      end

      def self.status
        :undefined_error
      end

      def status
        self.class.status
      end

      def self.error_code
        9999
      end

      def error_code
        self.class.error_code
      end
    end

    def self.build_status(code, status, message = nil)
      # Double underscores makes sure Foo Bar and FooBar get
      # the same treatment
      underscore_status = status.underscore.parameterize.underscore
      klass_name = underscore_status.camelize
      
      klass = if const_defined?(klass_name)
        const_get(klass_name)
      else
        define_api_status_constant(klass_name, underscore_status, code)
      end

      klass.new(message)
    end

    def self.define_api_status_constant(name, status, code)
      klass = const_set(name, Class.new(Base))
      klass.send(:define_singleton_method, :status) {status.to_sym}
      klass.send(:define_singleton_method, :error_code) {code}
      klass
    end

    # MindBody API code defintions
    # Commented out codes have not been verified via the API.
    # MindBody's own code definitions are not accurate and
    # they are not willing to provide the correct mappings
    # publically at this time
    STATUS_CODES = {
      #101 => "Invalid Source Credentials",
      102 => "InvalidCredentials",
      #103 => "Invalid Staff Credentials",
      #104 => "Invalid User Credentials",
      200 => "Success",
      #201 => "Something failed in your call",
      #301 => "Client ID doesn't exist",
      #302 => "Invalid SQL Format",
      #303 => "Client Index doesn't exist",
      #304 => "Client Index Value doesn't exist",
      #305 => "Missing Required Client Fields",
      #306 => "Invalid Class ID",
      #308 => "Related Client ID doesn't exist",
      #309 => "Client Custom Field doesn't exist",
      #310 => "Client Custom Field Value has an incorrect data type",
      #311 => "Rep ID doesn't exist",
      #312 => "Staff ID doesn't exist",
      #313 => "Missing required fields",
      #314 => "Session/Appointment Type ID doesn't exist",
      315 => "InvalidParameters",
      #316 => "Appointment ID doesn't exist",
      #317 => "Availabiliy ID doesn't exist",
      #318 => "Invalid Payment Info",
      #319 => "Staff not available",
      #320 => "Client Service ID not found",
      #321 => "Class Schedule ID doesn't exist",
      #322 => "ContactLog Creation/Update Error",
      #323 => "Unable to find client or found duplicate",
      #324 => "Add/Update Staff error",
      #501 => "Scheduling restrictions failed",
      #502 => "Client is suspended from booking",
      #503 => "Client needs payment",
      #504 => "Client already booked",
      #600 => "Class full",
      #601 => "Class requires payment",
      #602 => "Class is outside of scheduling window",
      #603 => "Client already booked at this time",
      #604 => "Client doesn't meet the prerequisites",
      #605 => "Class capacity exceeded exception",
      #606 => "Client already on waitlist",
      #607 => "Waitlist full exception",
      #700 => "Invalid booking time",
      #800 => "Permission Exception",
      #801 => "Staff member may not receive tips",
      #900 => "RetailObject Exception",
      #901 => "RetailItemNotFound Exception",
      #1000 => "Location ID doesn't exist",
      #1001 => "Setting Not Enabled on site",
      #1002 => "PromotionCode Exception",
      #1003 => "Resource Exception",
      #2000 => "Finder user does not exist",
      #2001 => "Finder user already exists"
    }
  end
end
