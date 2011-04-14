class BlogHomeController < ApplicationController
  load_and_authorize_resource :blog
  before_filter :find_blog
  protected

  def find_blog
    if request.subdomain
      @blog=Blog.find_by_subdomain(request.subdomain)
    else
      @blog=Blog.find_by_id(params[:id])
    end
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
