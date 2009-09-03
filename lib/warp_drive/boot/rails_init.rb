module Rails # :nodoc:
  class Initializer # :nodoc:
    
    WarpDrive::RAILS_INIT_METHODS.each do |meth|
      alias_method "#{meth}_without_warp_drive", meth
      define_method("#{meth}_with_warp_drive", WarpDrive::Procs.send(meth))
      alias_method meth, "#{meth}_with_warp_drive"
    end
    
  end # Initializer
end # Rails