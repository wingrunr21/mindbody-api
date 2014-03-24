require 'spec_helper'

describe MindBody::Models::Relationship do
  it {should respond_to(:id)}
  it {should respond_to(:relationship_name1)}
  it {should respond_to(:relationship_name2)}
end
