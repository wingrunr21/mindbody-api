require 'spec_helper'

describe MindBody::Models::Site do
  before do
    @site = MindBody::Models::Site.new(:page_color1 => 'red',
                                       :page_color2 => 'green',
                                       :page_color3 => 'blue',
                                       :page_color4 => 'yellow')
  end

  subject { @site }

  it { should respond_to(:id) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:logo_url) }
  it { should respond_to(:page_color1) }
  it { should respond_to(:page_color2) }
  it { should respond_to(:page_color3) }
  it { should respond_to(:page_color4) }
  it { should respond_to(:accepts_visa) }
  it { should respond_to(:accepts_discover) }
  it { should respond_to(:accepts_master_card) }
  it { should respond_to(:accepts_american_express) }
  it { should respond_to(:contact_email) }
  it { should respond_to(:page_colors) }

  it 'should return an array of page colors' do
    expect(subject.page_colors).to eql(['red', 'green', 'blue', 'yellow'])
  end
end
