require 'spec_helper'

describe MindBody::Models::Sale do
  it { should respond_to(:id) }
  it { should respond_to(:sale_date_time) }
  it { should respond_to(:location) }
  it { should respond_to(:payments) }
end
