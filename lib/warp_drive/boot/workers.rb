module WarpDrive
  extend self
  # --- RAILS --- #
  def load_plugins # :nodoc:
    Rails.configuration.plugin_paths << WarpDrive::Path.vendor.plugins.to_s
  end

  def set_load_path # :nodoc:
    Rails.configuration.load_paths = [Rails.configuration.load_paths,
                                      WarpDrive::Path.lib.to_s,
                                      WarpDrive::Path.app.to_s,
                                      WarpDrive::Path.app.models.to_s,
                                      WarpDrive::Path.app.controllers.to_s,
                                      WarpDrive::Path.app.helpers.to_s].flatten
  end
  
  def load_gems # :nodoc:
    begin
      require('gemtronics')

      sr_gem_path = WarpDrive::Path.config.gemtronics.rb
      Gemtronics.load(sr_gem_path) if File.exists?(sr_gem_path)

      local_path = File.join(RAILS_ROOT, 'config', 'gemtronics.rb')
      Gemtronics.load(local_path) if File.exists?(local_path)
      Gemtronics.require_gems(RAILS_ENV, :verbose => false)
    rescue Exception => e
      puts "Problems loading Gemtronics: #{e.message}"
      puts "This probably means you aren't using Gemtronics."
    end

  end
  
  def initialize_routing # :nodoc:
    # this method is a copy/paste of the method of the same name in the rails 2.3.4 initializer.rb
    # we're doing this to be able to insert the warp drive routes at the correct place in the 
    # routes list to be able to override them with client applications
    return unless Rails.configuration.frameworks.include?(:action_controller)

    ActionController::Routing.controller_paths += Rails.configuration.controller_paths
    ActionController::Routing::Routes.add_configuration_file(Rails.configuration.routes_configuration_file)
    
    # this is the only bit we've changed from the rails 2.3.4 initializer.rb
    ActionController::Routing::Routes.add_configuration_file(WarpDrive::Path.config.routes.rb.to_s)
    
    ActionController::Routing::Routes.reload!
  end
  
  def load_view_paths # :nodoc:
    ActionController::Base.view_paths = [ActionController::Base.view_paths,
                                         WarpDrive::Path.app.views.to_s].flatten
    ActionMailer::Base.view_paths = ActionController::Base.view_paths
  end
  
  def initialize_dependency_mechanism # :nodoc:
    ActiveSupport::Dependencies.class_eval do
      class << self
        alias_method :require_or_load_without_warp_drive, :require_or_load

        def require_or_load_with_warp_drive(file_name, const_path = nil) # :nodoc:
          sr_file_name = file_name.gsub(RAILS_ROOT, WarpDrive::ROOT)
          require_or_load_without_warp_drive(sr_file_name, const_path) if File.exists?(sr_file_name)
          require_or_load_without_warp_drive(file_name, const_path)
        end
      
        alias_method :require_or_load, :require_or_load_with_warp_drive
      end
    end
  end
  
  def initialize_database # :nodoc:
    Rails.configuration.instance_eval do
      def database_configuration # :nodoc:
        require 'erb'
        db_opts = {}
        
        [WarpDrive::Path.config.database.yml.to_s, 
         File.join(RAILS_ROOT, 'config', 'database.yml')].each do |yml_path|
           if File.exists?(yml_path)
             opts = YAML::load(ERB.new(File.read(yml_path)).result)
             db_opts.recursive_merge!(opts) if opts
           end
        end
        
        db_opts
      end # database_configuration
    end # Rails.configuration.instance_eval
  end
  
  def load_application_initializers # :nodoc:
    Dir[File.join(WarpDrive::Path.config.initializers.to_s, '**', '*.rb')].sort.each do |initializer|
      initializer = File.expand_path(initializer)
      load(initializer)
    end
  end
  
  def initialize_database_middleware # :nodoc:
    require File.join(File.dirname(__FILE__), 'migration_override')
  end
  
  # --- Non-RAILS --- #

  def load_rake_tasks # :nodoc:
    require 'rake'
    Dir.glob(File.join(WarpDrive::Path.lib.tasks.to_s, '**', '*.*')).sort.each do |task|
      load File.expand_path(task) unless task.match(/\/private\//)
    end
    Dir.glob(File.join(WarpDrive::Path.vendor.plugins.to_s, '*')).sort.each do |plugin|
      Dir.glob(File.join(plugin, 'tasks', '**', '*.*')).sort.each do |task|
        load File.expand_path(task) unless task.match(/\/private\//) 
      end
    end
  end
  
  def load_assets # :nodoc:
    Dir.glob(File.join(WarpDrive::ROOT, 'public', '**', 'warp_drive', '**', '*.*')).sort.each do |f|
      f.match(/public\/(.*warp_drive)/)
      base_path = $1
      rails_path = File.join(RAILS_ROOT, 'public', base_path)
      FileUtils.rm_rf(rails_path, :verbose => false) if File.exists?(rails_path)
      f.match(/(^.+public\/.*warp_drive)/)
      begin
        FileUtils.ln_sf($1, rails_path)
      rescue Exception => e
      end
    end
  end
  
  def method_missing(sym, *args) # :nodoc:
    # puts "Tried to call WarpDrive.#{sym} but it doesn't exist!"
  end
  
end
