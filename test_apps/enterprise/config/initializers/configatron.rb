require 'configatron'
root = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
Configatron::Rails.init(File.expand_path(File.join(root, 'config', 'configatron')))