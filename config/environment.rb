# Be sure to restart your web server when you modify this file.

# Uncomment below to force Rails into production mode when 
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
# RAILS_GEM_VERSION = '2.1.0' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here
  
  # Skip frameworks you're not going to use (only works if using vendor/rails)
  # config.frameworks -= [ :action_web_service, :action_mailer ]

  # Only load the plugins named here, by default all plugins in vendor/plugins are loaded
  # config.plugins = %W( exception_notification ssl_requirement )

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level 
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Use the database for sessions instead of the file system
  # (create the session table with 'rake db:sessions:create')
  config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper, 
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector
  config.active_record.observers = :user_observer

  # Make Active Record use UTC-base instead of local time
  # config.active_record.default_timezone = :utc
  
  # See Rails::Configuration for more options
  # Your secret key for verifying cookie-based 
  # session data integrity. 
  # If you change this key, all existing sessions 
  # will become invalid! 
  config.action_controller.session = { 
     :session_key => '_myapp_demo-session', 
     :secret      => 'ojweoijwoeioiu3oi5u6oi7oi46oi7oi567io5io67j5o8i6joi9oo7i8io0io0oi97io07oio97io090' 
  } 

  ## Load gems from vendor/gems
  config.load_paths += Dir.glob(File.join(RAILS_ROOT, 'vendor', 'gems', '*', 'lib'))


      
end

# Add new inflection rules using the following format 
# (all these examples are active by default):
# Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register "application/x-mobile", :mobile
$KCODE = 'u'


# active mailer configuration
# First, specify the Host that we will be using later for user_notifier.rb
HOST = 'http://localhost:3000'

# Second, add the :user_observer
# Rails::Initializer.run do |config|
#   # The user observer goes inside the Rails::Initializer block
# config.active_record.observers = :user_observer
# end

# Third, add your SMTP settings
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "mail.cleantogether.com",
  :port => 25,
  :domain => "mail.cleantogether.com",
  :user_name => "carmelyne@yourrailsapp.com",
  :password => "yourrailsapp",
  :authentication => :login
}


# Include your application configuration below
# these credentials are not real, ask a preallowed admin for the login/password to use in local configuration
PREALLOWED_LOGIN = 'cleantogether_rest'
PREALLOWED_PASSWORD = 'admin'

CLIENT_ID = "2"
USER_ROLE_ID = "3"
TEAM_CAPTAIN_ROLE_ID = "4"
ADMIN_ROLE_ID = "5"
PREALLOWED_HOST = "http://localhost:3001"
CLIENTS_URI = PREALLOWED_HOST + "/clients/" + CLIENT_ID
