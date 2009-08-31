require File.dirname(__FILE__) + '/../spec_helper'

describe 'Initilizers' do
  
  it 'should load configatron' do
    configatron.app.name.should == 'enterprise'
    configatron.star_trek.best.movie.should == 'Wrath of Khan'
  end
  
end