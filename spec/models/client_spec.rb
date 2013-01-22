require 'spec_helper'

describe MindBody::Models::Client do
  it {should respond_to(:id)}
  it {should respond_to(:first_name)}
  it {should respond_to(:last_name)}
  it {should respond_to(:gender)}
  it {should respond_to(:email)}
  it {should respond_to(:email_opt_in)}
  it {should respond_to(:address_line1)}
  it {should respond_to(:address_line2)}
  it {should respond_to(:city)}
  it {should respond_to(:state)}
  it {should respond_to(:postal_code)}
  it {should respond_to(:country)}
  it {should respond_to(:birth_date)}
  it {should respond_to(:home_location)}
  it {should respond_to(:is_prospect)}
  it {should respond_to(:is_company)}
  it {should respond_to(:notes)}
  it {should respond_to(:mobile_phone)}
  it {should respond_to(:home_phone)}
  it {should respond_to(:photo_url)}
  it {should respond_to(:username)}
  it {should respond_to(:first_appointment_date)}
  it {should respond_to(:name)}

  it 'should concatenate first_name and last_name to be name' do
    subject.first_name = "Bob"
    subject.last_name = "Dole"
    expect(subject.name).to eql("Bob Dole")
  end
end
