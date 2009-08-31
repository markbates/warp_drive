require File.dirname(__FILE__) + '/../spec_helper'

describe WarpDrive::Path do
  
  before(:each) do
    WarpDrive.send(:remove_const, 'ROOT') rescue nil
    WarpDrive::ROOT = '/tmp'
  end
  
  after(:each) do
    WarpDrive.send(:remove_const, 'ROOT')
  end
  
  it 'should create new path objects' do
    WarpDrive::Path.lib.should be_kind_of(WarpDrive::Path)
    WarpDrive::Path.lib.tasks.should be_kind_of(WarpDrive::Path)
  end
  
  describe 'to_s' do
    
    it 'should return the path' do
      WarpDrive::Path.lib.to_s.should == '/tmp/lib'
      WarpDrive::Path.lib.tasks.to_s.should == '/tmp/lib/tasks'
    end
    
  end
  
  describe '/' do
    
    it 'should join two paths' do
      path = WarpDrive::Path.lib / 'tasks'
      path.should == '/tmp/lib/tasks'
    end
    
  end
  
  %w{rb yml}.each do |ext|
    
    describe ext do
      
      it 'should return the path to the extension' do
        WarpDrive::Path.config.database.send(ext).should == "/tmp/config/database.#{ext}"
      end
      
    end
    
  end
  
end
