module WarpDrive
  
  RAILS_INIT_METHODS = %w{
    install_gem_spec_stubs
    set_load_path
    require_frameworks
    set_autoload_paths
    add_plugin_load_paths
    load_environment
    preload_frameworks
    initialize_encoding
    initialize_database
    initialize_cache
    initialize_framework_caches
    initialize_logger
    initialize_framework_logging
    initialize_dependency_mechanism
    initialize_whiny_nils
    initialize_time_zone
    initialize_i18n
    initialize_framework_settings
    initialize_framework_views
    initialize_metal
    add_support_load_paths
    check_for_unbuilt_gems
    load_plugins
    add_gem_load_paths
    load_gems
    check_gem_dependencies
    gems_dependencies_loaded
    load_application_initializers
    after_initialize
    initialize_database_middleware
    prepare_dispatcher
    initialize_routing
    load_observers
    load_view_paths
    load_application_classes
    disable_dependency_loading
  }
  
end