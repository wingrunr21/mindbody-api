require 'spec_helper'

describe MindBody::Models::ClassDescription do
  it { should respond_to(:level) }
  it { should respond_to(:id) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:notes) }
  it { should respond_to(:last_updated) }
  it { should respond_to(:program) }
  it { should respond_to(:session_type) }
end
