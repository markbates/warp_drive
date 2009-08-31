module ActiveRecord
  class Migrator
  
    migs = []
    migs << ActiveRecord::Migrator.new(:up, WarpDrive::Path.db.migrate).migrations
    migs << ActiveRecord::Migrator.new(:up, File.join(RAILS_ROOT, 'db', 'migrate')).migrations
    migs.flatten!
  
    define_method('migrations') do
      return migs
    end
  
  end
end