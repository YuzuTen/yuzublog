class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error]= "You do not have permission to perform the requested action."
    redirect_to(root_url)
  end
end
