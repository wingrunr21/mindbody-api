require 'spec_helper'

describe MindBody::Services::StaffService do
  subject { MindBody::Services::StaffService }

  it { should respond_to(:get_staff) }
  it { should respond_to(:get_staff_permissions) }
  it { should respond_to(:add_or_update_staff) }
  it { should respond_to(:get_staff_img_url) }
end
