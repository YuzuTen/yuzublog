# This file is used by Rack-based servers to start the application.
#Rack::Rescue::Exceptions.add_defaults("CanCan::AccessDenied", :status => 404)

require ::File.expand_path('../config/environment',  __FILE__)

run Weblog::Application
