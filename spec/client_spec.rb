require 'spec_helper'

describe MindBody::Services::Client do
  before do
    creds = double('credentials')
    creds.stub(:log_level).and_return(:debug)
    creds.stub(:source_name).and_return('test')
    creds.stub(:source_key).and_return('test_key')
    creds.stub(:site_ids).and_return([-99])
    creds.stub(:open_timeout).and_return(nil)
    creds.stub(:read_timeout).and_return(nil)
    creds.stub(:username).and_return(nil)
    creds.stub(:password).and_return(nil)
    creds.stub(:prod_mode).and_return(true)
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

    # We use #send here because `auth_params` is a private method and when
    # adding this functionality I didn't want to change the public API contract.
    # This should be considered an external-facing unit test as calls to
    # {#call} now respect `auth:` alongside `:message`.
    describe " (when using `auth:`)" do
      it 'should inject MindBody.configuration values for the nil case' do
        ret = subject.send(:auth_params, nil)

        expect(ret["SourceCredentials"]["SourceName"]).to eq('test')
        expect(ret["SourceCredentials"]["Password"]).to eq('test_key')
        expect(ret["SourceCredentials"]["SiteIDs"]["int"]).to eq([-99])
        expect(ret["UserCredentials"]).to be_nil
      end

      it 'should defer to passed-in values when provided' do
        auth = {
          :source_name => "override_name",
          :source_key => "override_key",
          :site_ids => [ -105 ]
        }

        ret = subject.send(:auth_params, auth)

        expect(ret["SourceCredentials"]["SourceName"]).to eq('override_name')
        expect(ret["SourceCredentials"]["Password"]).to eq('override_key')
        expect(ret["SourceCredentials"]["SiteIDs"]["int"]).to eq([-105])
        expect(ret["UserCredentials"]).to be_nil
      end

      it 'should inject UserCredentials when provided' do
        auth = {
          :source_name => "override_name",
          :source_key => "override_key",

          :username => "override_user",
          :password => "override_pass",

          :site_ids => [ -105 ]
        }

        ret = subject.send(:auth_params, auth)

        expect(ret["SourceCredentials"]["SourceName"]).to eq('override_name')
        expect(ret["SourceCredentials"]["Password"]).to eq('override_key')
        expect(ret["SourceCredentials"]["SiteIDs"]["int"]).to eq([-105])
        expect(ret["UserCredentials"]["Username"]).to eq('override_user')
        expect(ret["UserCredentials"]["Password"]).to eq('override_pass')
        expect(ret["UserCredentials"]["SiteIDs"]["int"]).to eq([-105])
      end
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
