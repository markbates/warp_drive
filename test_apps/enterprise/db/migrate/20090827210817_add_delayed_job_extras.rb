class AddDelayedJobExtras < ActiveRecord::Migration
  def self.up
    add_column :delayed_jobs, :deleted_at, :datetime
    add_column :delayed_jobs, :worker_class_name, :string
  end

  def self.down
    remove_column :delayed_jobs, :worker_class_name
    remove_column :delayed_jobs, :deleted_at
  end
end