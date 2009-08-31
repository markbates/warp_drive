module WarpDrive
  
  class << self
    
    def configure
      yield configatron.warp_drive
    end
    
  end
  
end