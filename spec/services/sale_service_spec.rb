require 'spec_helper'

describe MindBody::Services::SaleService do
  subject { MindBody::Services::SaleService }

  it { should respond_to(:get_accepted_card_type) }
  it { should respond_to(:get_sales) }
  it { should respond_to(:get_services) }
  it { should respond_to(:get_packages) }
  it { should respond_to(:get_products) }
  it { should respond_to(:get_custom_payment_methods) }
end
