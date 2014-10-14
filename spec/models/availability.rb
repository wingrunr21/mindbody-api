require 'spec_helper'

describe MindBody::Models::Availability do
  it { should respond_to(:location_id) }
  it { should respond_to(:start_date_time) }
  it { should respond_to(:end_date_time) }
  it { should respond_to(:unavailable_description) }
end
