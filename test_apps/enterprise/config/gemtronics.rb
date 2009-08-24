group(:default) do |g|
  g.add('daemons', {:load => false, :version => ">=1.0.10"})
  g.add('rails', {:load => false, :version => "2.3.3"})
  g.add('cachetastic', {:version => ">=3.0.0", :require => "cachetastic"})
  g.add('javan-whenever', {:version => ">=0.3.6", :require => "whenever"})
  g.add('configatron', {:version => ">=2.3.2"})
  g.add('mbleigh-acts-as-taggable-on', {:version => ">=1.0.5", :require => "acts-as-taggable-on"})
  g.add('mislav-will_paginate', {:load => true, :version => ">=2.3.11", :require => "will_paginate"})
  g.add('semanticart-is_paranoid', {:version => ">=0.9.0", :require => "is_paranoid"})
  g.add('authlogic', {:load => true, :version => ">=2.1.1", :require => "authlogic"})
  g.add('paperclip', {:version => ">=2.1.2", :require => "paperclip"})
end

alias_group(:production, :default)
alias_group(:development, :default)

group(:test, :dependencies => :development, :load => false) do |g|
  g.add('rspec', :version => '>=1.2.8')
  g.add('rspec-rails', :version => '>=1.2.7.1')
  g.add('remarkable_rails', :version => '3.1.8', :require => 'remarkable_rails')
  g.add('thoughtbot-factory_girl', :version => '1.2.2', :require => 'factory_girl')
end

group(:cucumber, :dependencies => :test, :load => false) do |g|
  g.add('cucumber', :version => '0.3.94')
  g.add('webrat', :version => '>=0.4.4')
end