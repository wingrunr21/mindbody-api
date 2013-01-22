require 'spec_helper'

describe MindBody::Models::SessionType do
  it { should respond_to(:id) }
  it { should respond_to(:name) }
end
