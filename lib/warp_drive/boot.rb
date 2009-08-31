require File.join(File.dirname(__FILE__), '..', 'warp_drive')

unless defined?(WARP_DRIVE_INITIALIZED)
  
  wd_path = File.join(File.dirname(__FILE__), 'boot')
  
  [:workers, :method_list, :procs, :rails_init].each do |file|
    require File.join(wd_path, file.to_s)
  end
  
  WarpDrive.load_assets
  
end