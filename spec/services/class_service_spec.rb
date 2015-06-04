require 'spec_helper'

describe MindBody::Services::ClassService do
  subject { MindBody::Services::ClassService }

  it { should respond_to(:get_classes) }
  it { should respond_to(:get_class_visits) }
  it { should respond_to(:get_class_descriptions) }
  it { should respond_to(:get_class_schedules) }
  it { should respond_to(:add_clients_to_enrollments) }
  it { should respond_to(:add_clients_to_classes)}
  it { should respond_to(:remove_clients_from_classes)}
end
