class WarpDriveGemGenerator < Genosaurus
  require_param :app
  require_param :out_dir
  
  def before_generate
    copy_major_directories
    remove_private_rake_tasks
    remove_private_assets
    remove_private_configs
  end
  
  private
  def copy_major_directories
    %w{app config lib public vendor}.each do |dir|
      Dir[File.join(pwd, dir, '**', '*.*')].each do |f|
        self.copy(f, f.gsub(pwd, 'lib'))
      end
    end
    
    %w{db}.each do |dir|
      Dir[File.join(pwd, dir, '**', '*.rb')].each do |f|
        self.copy(f, f.gsub(pwd, 'lib'))
      end
    end
  end
  
  def remove_private_rake_tasks
    Dir[File.join(out_lib_dir, 'lib', 'tasks', '**', 'private')].each do |f|
      rm_rf(f, :verbose => false)
    end
  end
  
  def remove_private_assets
    pub_path = File.join(out_lib_dir, 'public')
    Dir[File.join(pub_path, '**', '*.*')].each do |f|
      tpath = f.gsub(pub_path, '')
      unless tpath.match(/\/warp_drive\//)
        rm(f, :verbose => false)
      end
    end
  end
  
  def remove_private_configs
    %w{boot.rb environment.rb}.each do |f|
      rm(File.join(out_lib_dir, 'config', f), :verbose => false)
    end
  end
  
  def out_lib_dir
    File.join(self.out_dir, 'lib')
  end
  
end