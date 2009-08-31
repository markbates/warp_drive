require File.dirname(__FILE__) + '/../spec_helper'

describe 'Assets' do
  
  it 'should have assets in folders marked warp_drive' do
    pub_path = File.join(RAILS_ROOT, 'public')
    %w{images/warp_drive/captain.png javascripts/warp_drive/kirk.js
       stylesheets/warp_drive/spock.css stylesheets/warp_drive/engine_room/scotty.css}.each do |f|
       File.should be_exists(File.join(pub_path, f))
     end
  end
  
end