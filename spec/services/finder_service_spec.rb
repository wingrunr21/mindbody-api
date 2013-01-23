require 'spec_helper'

describe MindBody::Services::FinderService do
  subject { MindBody::Services::FinderService }

  it { should respond_to(:get_classes_within_radius) }
  it { should respond_to(:get_session_types_within_radius) }
  it { should respond_to(:get_business_locations_within_radius) }
end
