require 'spec_helper'

describe MindBody::Services::SiteService do
  subject { MindBody::Services::SiteService }

  it { should respond_to(:get_sites) }
  it { should respond_to(:get_locations) }
  it { should respond_to(:get_activation_code) }
  it { should respond_to(:get_programs) }
  it { should respond_to(:get_session_types) }
  it { should respond_to(:get_resources) }
  it { should respond_to(:get_relationships) }
end
