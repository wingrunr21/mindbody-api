require 'spec_helper'

describe MindBody::Models::Appointment do
  it { should respond_to(:id) }
  it { should respond_to(:status) }
  it { should respond_to(:start_date_time) }
  it { should respond_to(:end_date_time) }
  it { should respond_to(:notes) }
  it { should respond_to(:staff_requested) }
  it { should respond_to(:program) }
  it { should respond_to(:session_type) }
  it { should respond_to(:location) }
  it { should respond_to(:staff) }
  it { should respond_to(:client) }
  it { should respond_to(:first_appointment) }
  it { should respond_to(:client_service) }
  it { should respond_to(:resources) }
end
