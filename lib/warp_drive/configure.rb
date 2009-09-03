module WarpDrive
  
  class << self
    
    # Use this method in your Rakefile to configure the resulting
    # Warp Drive gem.
    # 
    # Example:
    #   WarpDrive.configure do |config|
    #     # Define your gem spec settings here:
    #     config.gem.version = "1.2.3"
    #     config.gem.email = 'me@example.com'
    #     config.gem.homepage = 'http://www.example.com'
    #   
    #     # Add your gem dependencies here:
    #     config.dependencies = {'warp_drive' => '>=0.1.0'}
    #   end
    def configure
      yield configatron.warp_drive
    end
    
  end
  
end