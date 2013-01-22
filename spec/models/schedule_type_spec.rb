require 'spec_helper'

describe MindBody::Models::ScheduleType do
  context 'when a valid type is specified' do
    before { @type = MindBody::Models::ScheduleType.new('All') }
    subject { @type }

    its(:type) { should eql('All') }
  end

  context 'when an invalid type is specified' do
    before { @type = MindBody::Models::ScheduleType.new('foobar') }
    subject { @type }

    its(:type) { should be_nil }
  end
end
