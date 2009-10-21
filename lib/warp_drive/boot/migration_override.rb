module ActiveRecord # :nodoc:
  class Migrator # :nodoc:
  
    def migrations_with_warp_drive
      migs = []
      migs << ActiveRecord::Migrator.new(:up, WarpDrive::Path.db.migrate).migrations
      migs << ActiveRecord::Migrator.new(:up, File.join(RAILS_ROOT, 'db', 'migrate')).migrations
      migs.flatten
    end
    
    alias_method_chain :migrations, :warp_drive
  
  end
end