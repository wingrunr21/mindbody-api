require 'spec_helper'

describe MindBody::Models::Payment do
  it { should respond_to(:id) }
  it { should respond_to(:amount) }
  it { should respond_to(:method) }
  it { should respond_to(:type) }
  it { should respond_to(:notes) }
end
