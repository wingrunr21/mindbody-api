require 'spec_helper'

describe MindBody::Models::Resource do
  it { should respond_to(:id) }
  it { should respond_to(:name) }
end
