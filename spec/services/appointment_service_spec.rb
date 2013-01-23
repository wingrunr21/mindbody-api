require 'spec_helper'

describe MindBody::Services::AppointmentService do
  subject { MindBody::Services::AppointmentService }

  it { should respond_to(:get_staff_appointments) }
  it { should respond_to(:get_bookable_items) }
  it { should respond_to(:get_schedule_items) }
end
