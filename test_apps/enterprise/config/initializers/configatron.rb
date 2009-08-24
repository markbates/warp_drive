require 'configatron'
config_path = File.join(RAILS_ROOT, 'config', 'configatron')
[:defaults, RAILS_ENV].each do |env|
  f = File.join(config_path, "#{env}.rb")
  # puts File.expand_path(f)
  require f if File.exists?(f)
end