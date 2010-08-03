# Uncomment below to force Rails into production mode when 
# you don't control web/app server and can't set it the proper way
ENV['RAILS_ENV'] ||= 'production'

RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here
  
  # Skip frameworks you're not going to use (only works if using vendor/rails)
  config.frameworks -= [ :action_web_service ]


  # Specify gems that this application depends on. 
  # They can then be installed with "rake gems:install" on new installations.
  # You have to specify the :lib option for libraries, where the Gem name (sqlite3-ruby) differs from the file itself (sqlite3)
  config.gem "authlogic", :version => "<= 2.1.3"
  config.gem "mislav-will_paginate", :version => ">= 2.3.0", :lib => "will_paginate", :source => "http://gems.github.com"
  config.gem "resource_controller", :version => "0.6.6"
  config.gem 'RedCloth', :lib => 'redcloth'
  config.gem 'faker'
  config.gem 'httparty'
  config.gem 'grackle'

  # Only load the plugins named here, by default all plugins in vendor/plugins are loaded
  #config.plugins = %W( will_paginate acts_as_ferret acts_as_list acts_as_tree exception_notification file_column ultrasphinx)

  # Add additional load paths for your own custom dirs
  config.load_paths += %W( #{RAILS_ROOT}/app/models/page_types )

  # Force all environments to use the same logger level 
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Make Active Record use UTC-base instead of local time
  # config.active_record.default_timezone = :utc
  
  # See Rails::Configuration for more options
  config.action_controller.session = { 
    :session_key => "_cms_session", 
    :secret => "h3g4iuHiug323uadsf8SDGHqwhueiQptyppa" }

    config.cache_store = :timed_file_store, File.join(RAILS_ROOT, 'tmp', 'cache')
  
end



# Include your application configuration below
