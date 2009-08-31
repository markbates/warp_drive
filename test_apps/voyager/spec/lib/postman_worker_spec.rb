require File.dirname(__FILE__) + '/../spec_helper'

describe PostmanWorker do
  
  it 'should pass the call onto the appropriate method on Postman' do
    user = Factory(:user)
    Postman.should_receive(:deliver_welcome_email).with(user)
    PostmanWorker.deliver_welcome_email(user)
  end
  
end
