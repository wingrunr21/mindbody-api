require 'spec_helper'

describe MindBody::Models::Service do
  it { should respond_to(:id) }
  it { should respond_to(:price) }
  it { should respond_to(:online_price) }
  it { should respond_to(:tax_rate) }
  it { should respond_to(:product_id) }
  it { should respond_to(:name) }
  it { should respond_to(:count) }
end
