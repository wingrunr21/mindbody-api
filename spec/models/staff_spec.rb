require 'spec_helper'

describe MindBody::Models::Staff do
  it { should respond_to(:id) }
  it { should respond_to(:email) }
  it { should respond_to(:mobile_phone) }
  it { should respond_to(:home_phone) }
  it { should respond_to(:work_phone) }
  it { should respond_to(:address) }
  it { should respond_to(:address2) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:country) }
  it { should respond_to(:postal_code) }
  it { should respond_to(:foreign_zip) }
  it { should respond_to(:login_locations) }
  it { should respond_to(:name) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:image_url) }
  it { should respond_to(:bio) }
  it { should respond_to(:is_male) }
  it { should respond_to(:username) }

  it 'should alias photo_url to image_url' do
    subject.image_url = 'http://foobar.com/image.jpg'
    expect(subject.photo_url).to eql('http://foobar.com/image.jpg')
  end
end
