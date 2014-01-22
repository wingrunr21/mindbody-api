require 'spec_helper'

describe MindBody::Services::ClassService do
  subject { MindBody::Services::ClassService }

  it { should respond_to(:get_classes) }
  it { should respond_to(:get_class_visits) }
  it { should respond_to(:get_class_descriptions) }
  it { should respond_to(:get_class_schedules) }
end
