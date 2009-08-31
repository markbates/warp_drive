require File.join(File.dirname(__FILE__), '..', 'warp_drive')
Dir.glob(File.join(File.dirname(__FILE__), '..', 'tasks', '**/*.rake')).each do |f|
  load File.expand_path(f)
end