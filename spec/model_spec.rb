require 'spec_helper'

describe MindBody::Models::Base do
	subject { MindBody::Models::Base }

	it { should respond_to(:attribute) }
end
