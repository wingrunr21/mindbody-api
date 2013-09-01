require 'spec_helper'

describe MindBody::Models::ClientRelationship do
  it {should respond_to(:related_client)}
  it {should respond_to(:relationship)}
  it {should respond_to(:relationship_name)}
end
