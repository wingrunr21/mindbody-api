require 'spec_helper'

describe MindBody::Models::ClientService do
  it { should respond_to(:id) }
  it { should respond_to(:current) }
  it { should respond_to(:count) }
  it { should respond_to(:remaining) }
  it { should respond_to(:name) }
  it { should respond_to(:payment_date) }
  it { should respond_to(:active_date) }
  it { should respond_to(:expiration_date) }
  it { should respond_to(:program) }
end
