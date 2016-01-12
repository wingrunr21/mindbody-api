require 'spec_helper'

describe MindBody::Services::AppointmentService do
  subject { MindBody::Services::AppointmentService }

  it { should respond_to(:get_staff_appointments) }
  it { should respond_to(:get_bookable_items) }
  it { should respond_to(:get_schedule_items) }
  it { should respond_to(:add_or_update_appointments) }
  it { should respond_to(:add_or_update_availabilities) }
  it { should respond_to(:get_active_session_times) }
  it { should respond_to(:get_appointment_options) }
end
