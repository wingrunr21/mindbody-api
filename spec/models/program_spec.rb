require 'spec_helper'

describe MindBody::Models::Program do
  it { should respond_to(:id) }
  it { should respond_to(:name) }
  it { should respond_to(:schedule_type) }
end
