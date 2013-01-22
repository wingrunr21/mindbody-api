require 'spec_helper'

describe MindBody::Models::SaleItem do
  it { should respond_to(:sale) }
  it { should respond_to(:description) }
  it { should respond_to(:price) }
  it { should respond_to(:amount_paid) }
  it { should respond_to(:discount) }
  it { should respond_to(:tax) }
  it { should respond_to(:returned) }
  it { should respond_to(:quantity) }
end
