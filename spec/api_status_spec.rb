require 'spec_helper'

describe MindBody::APIStatus do
  subject { MindBody::APIStatus }

  describe '#build_status' do
    before do
      @preconstants = MindBody::APIStatus.constants
    end
    after do
      (MindBody::APIStatus.constants - @preconstants).each do |const|
        MindBody::APIStatus.send(:remove_const, const)
      end
    end

    it 'should return a new instance of the given status' do
      status = subject.build_status(102, 'InvalidCredentials')
      expect(status.error_code).to eq(102)
      expect(status.status).to eq :invalid_credentials
      expect(status.class.to_s).to eq 'MindBody::APIStatus::InvalidCredentials'
    end

    it 'should normalize oddities in the given status' do
      status = subject.build_status(315, 'invalid.parameters')
      expect(status.status).to eq :invalid_parameters
      expect(status.class.to_s).to eq 'MindBody::APIStatus::InvalidParameters'
    end

    context "when the status has already been defined" do
      before do
        MindBody::APIStatus.const_set('InvalidCredentials', MindBody::APIStatus::Base)
      end

      it 'should return the existing constant' do
        expect(MindBody::APIStatus).to receive(:define_api_status_constant).never

        subject.build_status(102, 'InvalidCredentials')
      end

      after do
        MindBody::APIStatus.send(:remove_const, 'InvalidCredentials')
      end
    end

    context "when a new status has been received" do
      before do
        MindBody::APIStatus.stub(:define_api_status_constant)
                           .and_return(MindBody::APIStatus::Base)
      end
      it 'should create a new constant' do
        expect(MindBody::APIStatus).to receive(:define_api_status_constant)
          .with('InvalidCredentials', 'invalid_credentials', 102)

        subject.build_status(102, 'InvalidCredentials')
      end
    end
  end

  describe '#define_api_status_constant' do
    before :all do
      @klass = MindBody::APIStatus.define_api_status_constant(
        'InvalidCredentials', :invalid_credentials, 102)
    end

    after :all do
      MindBody::APIStatus.send(:remove_const, 'InvalidCredentials')
    end

    it 'should create a new constant that is a subclass of Base' do
      expect(@klass.superclass).to eq MindBody::APIStatus::Base
    end

    it 'should override status to return the given status' do
      expect(@klass.status).to eq :invalid_credentials
    end

    it 'should override error_code to return the given code' do
      expect(@klass.error_code).to eq 102
    end
  end
end

describe MindBody::APIStatus::Base do

  it 'should have a status of :undefined_error' do
    expect(subject.status).to eq :undefined_error
  end

  it 'should have a status of :undefined_error at the class level' do
    expect(subject.class.status).to eq :undefined_error
  end

  it 'should delegate status up to the class level' do
    expect(subject.class).to receive(:status) 
    subject.status
  end

  it 'should have an error_code of 9999' do
    expect(subject.error_code).to eq 9999
  end

  it 'should have a error_code of 9999 at the class level' do
    expect(subject.class.error_code).to eq 9999
  end

  it 'should delegate status up to the class level' do
    expect(subject.class).to receive(:error_code) 
    subject.error_code
  end
end
