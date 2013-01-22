require 'spec_helper'

describe MindBody::Models::AppointmentStatus do
  context 'with an invalid status' do
    before { @status = MindBody::Models::AppointmentStatus.new('invalid') }
    subject { @status }

    its(:status) { should be_nil }
  end

  context 'with a valid status' do
    before { @status = MindBody::Models::AppointmentStatus.new('Booked') }
    subject { @status }

    its(:status) { should eql('Booked') }
  end
end
