require 'spec_helper'

describe MindBody::Models::Level do
  it { should respond_to(:id) }
  it { should respond_to(:name) }
end
