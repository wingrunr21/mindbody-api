require 'spec_helper'

describe MindBody::Services::Client do
  before do
    creds = double('credentials')
    creds.stub(:source_name).and_return('test')
    creds.stub(:source_key).and_return('test_key')
    creds.stub(:site_ids).and_return([-99])
    #Savon options
    creds.stub(:to_h).and_return({open_timeout: 0, read_timeout: 0})
    MindBody.stub(:configuration).and_return(creds)
    @client = MindBody::Services::Client.new(:wsdl => 'spec/fixtures/wsdl/geotrust.wsdl')

    resp = double('response')
    resp.stub(:http)
    Savon::Operation.any_instance.stub(:call).and_return(resp)
    MindBody::Services::Response.any_instance.stub(:normalize_response)
    MindBody::Services::Response.any_instance.stub(:error_code).and_return(200)
    MindBody::Services::Response.any_instance.stub(:status).and_return('Success')
  end

  subject { @client }

  describe '#call' do
    before :each do
      @locals = { :message => { 'Request' => {
                                  'SourceCredentials' => {
                                     'SourceName' => 'test',
                                     'Password' => 'test_key',
                                     'SiteIDs' => {'int' => [-99]}
                                   }
                                }}}
    end
    it 'should inject the auth params' do
      Savon::Operation.any_instance.should_receive(:call).once.with(@locals)
      subject.call(:hello)
    end

    it 'should correctly map Arrays to be int lists' do
      locals = @locals.dup
      locals[:message]['Request'].merge!({:site_ids => {'int' => [1,2,3,4]}})
      Savon::Operation.any_instance.should_receive(:call).once.with(locals)
      subject.call(:hello, :site_ids => [1,2,3,4])
    end

    it 'should return a MindBody::Services::Response object' do
      expect(subject.call(:hello)).to be_kind_of(MindBody::Services::Response)
    end
  end
end
