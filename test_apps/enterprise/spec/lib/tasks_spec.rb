require File.dirname(__FILE__) + '/../spec_helper'

describe 'Tasks' do
  
  it 'should allow me to see tasks' do
    tasks = `rake -T`
    tasks.should match(/jobs:work/)
    tasks.should match(/enterprise:weapons:fire/)
    tasks.should match(/enterprise:shields:status/)
  end
  
end