  class HomeController < ApplicationController
    before_filter :find_blog
    
    public
    def index
      @posts=@blog.posts.recent.paginate(:per_page => 10,:page => params[:page])
    end

    def about
    end

    def contact
    end

  end
