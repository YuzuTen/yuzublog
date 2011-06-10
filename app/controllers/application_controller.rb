class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error]= "You do not have permission to perform the requested action."
    redirect_to_previous
  end
  
  protected

  def find_blog
    blogs=Blog.find_by_hostname(request.host)
    throw NotFoundException if blogs.empty?
    @blog=blogs.first

    @tags=@blog.posts.tag_counts_on(:categories)
  end


  def redirect_to_previous
    referrer=request.env['HTTP_REFERER']
    
    if referrer.blank? || request.env['REQUEST_URI']==referrer
      redirect_to(:root)
    else
      redirect_to(:back)
    end 
  end
  
end
