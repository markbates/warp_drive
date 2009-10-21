module ActiveRecord # :nodoc:
  class Migrator # :nodoc:
    
    run_once do
      def migrations_with_warp_drive
        migs = []
        migs << ActiveRecord::Migrator.new(:up, WarpDrive::Path.db.migrate).migrations_without_warp_drive
        migs << ActiveRecord::Migrator.new(:up, File.join(RAILS_ROOT, 'db', 'migrate')).migrations_without_warp_drive
        migs.flatten
      end
    
      alias_method_chain :migrations, :warp_drive
    end
    
  end
end