require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  
  before(:each) do
    Factory(:user)
  end
  
  should_validate_presence_of :email
  should_validate_uniqueness_of :login
  
end
