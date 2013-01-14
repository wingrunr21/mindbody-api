require 'spec_helper'

describe MindBody do
	describe '#configuration' do
		subject { MindBody.configuration }

		it { should_not be_nil }
		it { should be_an_instance_of(MindBody::Config) }
	end

	describe '#configure' do
		it 'yields to the configuration object' do
			yielded_object = nil
			MindBody.configure do |config|
				yielded_object = config
			end
			yielded_object.should be MindBody.configuration
		end
	end
end

describe MindBody::Config do
	before :each do
		@config = MindBody::Config.new
	end

	subject { @config }

	context 'an instance' do
		it { should respond_to(:source_name) }
		it { should respond_to(:source_key) }
		it { should respond_to(:site_ids) }
	end

	describe '#new' do
		it { should_not be_nil }

		it 'should have default values' do
			@config.source_name.should == ''
			@config.source_key.should == ''
			@config.site_ids.should == []
		end

		it 'should load config data from ENV' do
			ENV['MINDBODY_SOURCE_NAME'] = 'test'
			ENV['MINDBODY_SOURCE_KEY'] = 'key1234'
			ENV['MINDBODY_SITE_IDS'] = '1,2,3,-4'

			@config = MindBody::Config.new
			@config.source_name.should == 'test'
			@config.source_key.should == 'key1234'
			@config.site_ids.should == [1,2,3,-4]
		end

		it 'should allow arbitrary delimiters for MINDBODY_SITE_IDS' do
			ENV['MINDBODY_SITE_IDS'] = '1 2 3 -4'
			@config = MindBody::Config.new
			@config.site_ids.should == [1,2,3,-4]

			ENV['MINDBODY_SITE_IDS'] = '1;2;3;-4'
			@config = MindBody::Config.new
			@config.site_ids.should == [1,2,3,-4]

			ENV['MINDBODY_SITE_IDS'] = '1:2:3:-4'
			@config = MindBody::Config.new
			@config.site_ids.should == [1,2,3,-4]
		end
	end

	describe '#site_ids=' do
		it 'should wrap all input into an array' do
			@config.site_ids = 5
			@config.site_ids.should == [5]

			@config.site_ids = [3,4]
			@config.site_ids.should == [3,4]
		end
	end
end
