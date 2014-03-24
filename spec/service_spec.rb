require 'spec_helper'

describe MindBody::Services::Service do
  subject { MindBody::Services::Service }

  it 'should extend Savon::Model' do
    should respond_to(:operations)
  end

  context 'with class method' do
    describe '#service' do
      before { subject.service(:test) }

      it 'should set the wsdl for the "test" service name' do
        expect(subject.instance_variable_get('@wsdl')).to match(/wsdl\/test\.wsdl/)
      end
    end

    describe '#client' do
      its(:client) { should be_an_instance_of(MindBody::Services::Client) }
    end

    describe '#operation' do
      before do
        MindBody::Services::Client.any_instance.stub(:call)
      end

      context 'with no options' do
        before :all do
          MindBody::Services::Service.operation :test
        end

        it { should respond_to(:test) }
        its(:new) { should respond_to(:test) }

        it 'should have optional locals' do
          expect(subject.method(:test).arity).to eql(-1)
        end

        it 'should delegate to the class method' do
          instance = subject.new
          locals = {:foo => :bar}

          subject.should_receive(:test).with(locals).once

          instance.test(locals)
        end
      end

      context 'with required params' do
        before :all do
          MindBody::Services::Service.operation :test_required, :required => [:foo, :bar]
        end

        it { should respond_to(:test_required) }
        its(:new) { should respond_to(:test_required) }

        it 'should have two required params and optional locals' do
          expect(subject.method(:test_required).arity).to eql(-3)
        end

        it 'should delegate to the class method' do
          instance = subject.new
          locals = {:foo => :bar}

          subject.should_receive(:test_required).with(:foo, :bar, locals).once

          instance.test_required(:foo, :bar, locals)
        end

        it 'should require two params' do
          expect{subject.send(:test_required)}.to raise_error(ArgumentError)
        end
      end

      context 'with no locals' do
        before :all do
          MindBody::Services::Service.operation :test_no_locals, :required => [:foo, :bar], :locals => false
        end

        it { should respond_to(:test_no_locals) }
        its(:new) { should respond_to(:test_no_locals) }

        it 'should have two required params and optional locals' do
          expect(subject.method(:test_no_locals).arity).to eql(2)
        end

        it 'should delegate to the class method' do
          instance = subject.new

          subject.should_receive(:test_no_locals).with(:foo, :bar).once

          instance.test_no_locals(:foo, :bar)
        end

        it 'should require two params' do
          expect{subject.send(:test_no_locals)}.to raise_error(ArgumentError)
        end

        it 'should not allow locals' do
          expect{subject.send(:test_no_locals, :foo, :bar, :foobar => 'foobar')}.to raise_error(ArgumentError)
        end
      end
    end
  end
end
