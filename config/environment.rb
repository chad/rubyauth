# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "clearance",
    :lib     => 'clearance',
    :source  => 'http://gemcutter.org',
    :version => '0.8.3'
  config.gem "formtastic", :lib => "formtastic"
  config.gem "oauth"
  config.gem "oauth-plugin"
end

HOST = "localhost"
DO_NOT_REPLY = "donotreply@example.com"
