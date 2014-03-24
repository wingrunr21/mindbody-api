require 'spec_helper'

describe MindBody::Services::Response do
  RESPONSE_HASH = {
    :foo_response => {
      :foo_result => {
        :status => 'Success',
        :clients => {
          :client => [{}, {}, {}]
        },
        :visits => nil,
        :string_list => {
          :string => ['a', 'b', 'c']
        },
        :int_list => {
          :int => [1,2,3,4,5,6]
        },
        :staff_members => {},
        :organizer => {},
        :purchases => {},
        :image_url => 'http://foobar.com/image.jpg',
        :mobile_image_url => 'http://foobar.com/mobile_image.jpg'
      }
    }
  }

  before :each do
    resp = double('response')
    resp.stub(:to_hash).and_return(RESPONSE_HASH)
    @response = MindBody::Services::Response.new resp
  end

  subject { @response }
  it { should respond_to(:response) }
  it { should respond_to(:result) }
  it { should respond_to(:status) }
  it { should respond_to(:error_code) }
  it { should respond_to(:xml_detail) }
  it { should respond_to(:result_count) }
  it { should respond_to(:current_page_index) }
  it { should respond_to(:total_page_count) }
  it { should respond_to(:remote_method) }
  it { should respond_to(:message) }
  it { should respond_to(:api_status) }

  context 'when delegating to @response' do
    before :each do
      subject.response.stub(:foo).and_return('foo')
    end

    it 'should respond_to methods on @response' do
      expect(subject.respond_to?(:foo)).to be true
    end

    it 'should dynamically define a delegate method' do
      subject.should_receive(:method_missing).with(:foo).once.and_call_original
      2.times { subject.foo }
    end

    it 'should call through to @response' do
      subject.response.should_receive(:foo).once
      expect(subject.foo).to eql('foo')
    end

    it 'should call super for methods @response does not respond_to' do
      expect{subject.bar}.to raise_error(NoMethodError)
    end
  end

  context 'when normalizing a response' do
    it 'should assign the normalized response to @result' do
      expect(subject.result).to_not be_nil
    end

    it 'should strip the *_response and *_result wrapper hashes' do
      expect(subject.result.has_key?(:foo_response)).to eql(false)
    end

    it 'should populate instance variables' do
      expect(subject.status).to eql('Success')
    end

    it 'should map :staff_members to Staff' do
      expect(subject.result[:staff_members]).to be_an_instance_of(MindBody::Models::Staff)
    end

    it 'should map :organizer to Staff' do
      expect(subject.result[:organizer]).to be_an_instance_of(MindBody::Models::Staff)
    end

    it 'should map :purchases to SaleItem' do
      expect(subject.result[:purchases]).to be_an_instance_of(MindBody::Models::SaleItem)
    end

    it 'should map :image_url to String' do
      expect(subject.result[:image_url]).to be_an_instance_of(String)
    end

    it 'should map :mobile_image_url to String' do
      expect(subject.result[:mobile_image_url]).to be_an_instance_of(String)
    end

    it 'should flatten a string list' do
      expect(subject.result[:string_list].class).to be(Array)
    end

    it 'should flatten an int list' do
      expect(subject.result[:int_list].class).to be(Array)
    end

    it 'should return nil for a nil entry' do
      expect(subject.result[:visits]).to be(nil)
    end
  end
end
