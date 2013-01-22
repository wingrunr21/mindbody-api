require 'spec_helper'

describe MindBody::Models::Semester do
  it { should respond_to(:id) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
end
