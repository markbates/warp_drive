module WarpDrive
  module Procs # :nodoc:
    
    class << self
      
      def load_plugins
        Proc.new do
          @plugin_loader = nil
          WarpDrive.load_plugins
          plugin_loader.add_plugin_load_paths
          load_plugins_without_warp_drive
        end
      end
      
      def initialize_dependency_mechanism
        Proc.new do
          initialize_dependency_mechanism_without_warp_drive
          WarpDrive.initialize_dependency_mechanism
        end          
      end
      
      def initialize_routing
        Proc.new do
          WarpDrive.initialize_routing
        end
      end
      
      def method_missing(meth, *args)
        Proc.new do
          WarpDrive.send(meth)
          send("#{meth}_without_warp_drive")
        end
      end
      
    end
    
  end # Procs
end # WarpDrive