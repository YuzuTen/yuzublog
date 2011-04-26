class HomeController < ApplicationController
  before_filter :find_blog

  protected

  def find_blog
    if request.subdomain
      @blog=Blog.find_by_subdomain(request.subdomain)
    end
    @blog=Blog.find_by_id!(params[:blog_id]) if @blog.nil?
    @tags=@blog.posts.tag_counts_on(:categories)
  end

  
  public
  def index
    @posts=@blog.posts.recent.paginate(:per_page => 10,:page => params[:page])
  end

  def about
  end

  def contact
  end

end
