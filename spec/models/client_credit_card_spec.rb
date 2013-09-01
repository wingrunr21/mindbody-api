require 'spec_helper'

describe MindBody::Models::ClientCreditCard do
  it {should respond_to(:card_number)}
  it {should respond_to(:card_holder)}
  it {should respond_to(:city)}
  it {should respond_to(:address)}
  it {should respond_to(:state)}
  it {should respond_to(:postal_code)}
  it {should respond_to(:exp_month)}
  it {should respond_to(:exp_year)}
end
