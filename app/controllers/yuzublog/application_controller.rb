module Yuzublog
  class ApplicationController < ActionController::Base
    protect_from_forgery

    include UrlHelper

    rescue_from CanCan::AccessDenied do |exception|
      flash[:error]= "You do not have permission to perform the requested action."
      redirect_to_previous
    end


    protected

    def find_blog
      logger.info "Yuzublog::ApplicationController find_blog called"
      begin
        blogs=Blog.find_by_hostname(request.host)
        @blog=blogs.first
        @tags=@blog.posts.tag_counts_on(:categories)
      rescue ActiveRecord::RecordNotFound
        redirect_to blogs_url
      end
    end

    def get_blog_index
      Blog.find :all
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
end
