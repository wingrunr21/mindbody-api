require 'spec_helper'

describe MindBody::Services::DataService do
  subject { MindBody::Services::DataService }

  it { should respond_to(:select_data_xml) }
  it { should respond_to(:select_data_csv) }
  it { should respond_to(:select_aggregate_data_xml) }
  it { should respond_to(:select_aggregate_data_csv) }
end
