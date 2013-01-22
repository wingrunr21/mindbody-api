require 'spec_helper'

describe MindBody::Models::Location do
  it { should respond_to(:id) }
  it { should respond_to(:business_id) }
  it { should respond_to(:site_id) }
  it { should respond_to(:business_description) }
  it { should respond_to(:additional_image_ur_ls) }
  it { should respond_to(:facility_square_feet) }
  it { should respond_to(:treatment_rooms) }
  it { should respond_to(:pro_spa_finder_site) }
  it { should respond_to(:has_classes) }
  it { should respond_to(:phone_extension) }
  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:address2) }
  it { should respond_to(:tax1) }
  it { should respond_to(:tax2) }
  it { should respond_to(:tax3) }
  it { should respond_to(:tax4) }
  it { should respond_to(:tax5) }
  it { should respond_to(:phone) }
  it { should respond_to(:city) }
  it { should respond_to(:state_prov_code) }
  it { should respond_to(:postal_code) }
  it { should respond_to(:latitude) }
  it { should respond_to(:longitude) }
  it { should respond_to(:distance_in_miles) }
  it { should respond_to(:image_url) }
  it { should respond_to(:description) }
  it { should respond_to(:has_site) }
  it { should respond_to(:can_book) }
  it { should respond_to(:additional_image_urls) }
end
