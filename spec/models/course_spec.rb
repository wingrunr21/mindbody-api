require 'spec_helper'

describe MindBody::Models::Course do
  it { should respond_to(:id) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:notes) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:location) }
  it { should respond_to(:organizer) }
  it { should respond_to(:program) }
  it { should respond_to(:image_url) }
end
