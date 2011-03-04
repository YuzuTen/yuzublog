# This file is used by Rack-based servers to start the application.
#Rack::Rescue::Exceptions.add_defaults("CanCan::AccessDenied", :status => 404)

require ::File.expand_path('../config/environment',  __FILE__)

use Rack::Rescue
Rack::Rescue::Exceptions.add_defaults("CanCan::AccessDenied", :status=>'401');
run Weblog::Application
