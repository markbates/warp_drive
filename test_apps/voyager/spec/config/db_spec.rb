require File.dirname(__FILE__) + '/../spec_helper'

describe 'Database' do
  
  describe 'database.yml' do
    
    it 'should have the correct settings' do
      config = ActiveRecord::Base.connection.instance_variable_get('@config')
      config[:timeout].should == 4000
      config[:adapter].should == 'sqlite3'
      config[:pool].should == 5
      config[:database].should match(/\/db\/test\.sqlite3/)
    end
    
  end
  
end