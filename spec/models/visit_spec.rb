require 'spec_helper'

describe MindBody::Models::Visit do
  it { should respond_to(:id) }
  it { should respond_to(:class_id) }
  it { should respond_to(:start_date_time) }
  it { should respond_to(:end_date_time) }
  it { should respond_to(:name) }
  it { should respond_to(:staff) }
  it { should respond_to(:location) }
  it { should respond_to(:client) }
  it { should respond_to(:web_signup) }
  it { should respond_to(:signed_in) }
  it { should respond_to(:make_up) }
  it { should respond_to(:service) }
end
