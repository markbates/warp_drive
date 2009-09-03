module WarpDrive
  # This class allows you to easily get the location of any file or path in a Warp Drive gem.
  # 
  # Example:
  #   WarpDrive::Path.app.controllers.application_controller.rb
  #   # => "/usr/local/lib/ruby/gems/1.8/gems/my_warp_drive_gem-1.2.3/lib/app/controllers/application_controller.rb"
  class Path

    attr_accessor :parent
    attr_accessor :path

    def initialize(parent, path)
      self.parent = parent
      self.path = path.to_s
    end

    def method_missing(sym, *args)
      if sym == :rb || sym == :yml
        return self.to_s + ".#{sym}"
      else
        WarpDrive::Path.new(self, sym)
      end
    end

    def to_s
      paths = [self.path]
      par = self.parent
      until par.nil?
        paths << par.path
        par = par.parent
      end
      paths << File.join(WarpDrive::ROOT)
      path = File.expand_path(File.join(paths.reverse))
      return path
    end

    def /(other)
      File.expand_path(File.join(self.to_s, other.to_s))
    end
    
    class << self
      
      def method_missing(sym, *args)
        WarpDrive::Path.new(nil, sym)
      end
      
    end
    
  end # Path
end # WarpDrive