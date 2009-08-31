require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  
  before(:each) do
    @user = Factory(:user)
  end
  
  should_validate_presence_of :email
  should_validate_uniqueness_of :login
  
  describe 'hello' do
    
    it 'should say hello' do
      @user.hello.should == "hello: #{@user.login}"
    end
    
  end
  
  describe 'bye' do
    
    it 'should say bye' do
      @user.bye.should == "Sorry to see you go: #{@user.login}"
    end
    
  end
  
end
