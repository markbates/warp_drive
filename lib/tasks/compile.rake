namespace :warp_drive do
  
  task :compile do
    path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'warp_drive', 'warp_drive_gem_generator'))
    require path
    $genosaurus_output_directory = File.join(pwd, 'tmp', File.basename(pwd))
    FileUtils.rm_rf($genosaurus_output_directory, :verbose => false)
    WarpDriveGemGenerator.run('APP' => File.basename(pwd), 'OUT_DIR' => File.join(pwd, 'tmp', File.basename(pwd)))

    sh "cd #{$genosaurus_output_directory}; rake package"
    FileUtils.rm_rf($genosaurus_output_directory, :verbose => false)
    # FileUtils.rm_rf(File.join(pwd, 'pkg'), :verbose => true)
    # mv File.join($genosaurus_output_directory, 'pkg'), File.join(pwd, 'pkg')
  end
  
  task :install => :compile do
    Dir[File.join($genosaurus_output_directory, 'pkg', '*.gem')].each do |g|
      sh "gem install #{g}"
    end
  end
  
end