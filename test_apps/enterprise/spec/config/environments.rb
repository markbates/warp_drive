require File.dirname(__FILE__) + '/../spec_helper'

describe 'Environments' do
  
  it 'should load the environments' do
    configatron.environments.test.hello.should == 'Hello!'
    configatron.environments.test.bye.should == 'Bye!'
  end
  
end