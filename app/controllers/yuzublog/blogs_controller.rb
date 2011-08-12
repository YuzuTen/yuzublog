module Yuzublog
  class BlogsController < ApplicationController
    unloadable

    include AASM

    #only allow editing/creating blogs if you're authenticated.
    #TODO: Restore authentication
    #    before_filter :authenticate_user!, :except =>  [ :index, :show, :rsd, :wlwmanifest ]
    before_filter :get_blog_index, :only => [:index]
    before_filter :find_blog, :only => [:show, :about, :contact]

    def find_blog
      params[:blog_id]=params[:id]
      super
    end
    #    load_and_authorize_resource :except => [:index, :rsd, :wlwmanifest ]

    # GET /blogs
    # GET /blogs.xml
    def index
      @blogs = Blog.all unless @blogs

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @blogs }
      end
    end
    
    def rsd
      logger.info("rsd called")
      @blog = Blog.find(params[:id])
      respond_to do |format|
        format.xml
      end
    end
    
    def wlwmanifest
      @blog = Blog.find(params[:id])
      respond_to do |format|
        format.xml
      end
    end

    def about
    end

    def contact
    end

    # GET /blogs/1
    # GET /blogs/1.xml
    def show
      logger.info("show called")
      @blog = Blog.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @blog }
      end
    end

    # GET /blogs/new
    # GET /blogs/new.xml
    def new
      @blog = Blog.new
      @users = User.all

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @blog }
      end
    end

    # GET /blogs/1/edit
    def edit
      @blog = Blog.find(params[:id])
      @users = User.all
    end

    # POST /blogs
    # POST /blogs.xml
    def create
      @blog = current_site.blogs.new(params[:blog])
      
      respond_to do |format|
        if @blog.save
          format.html { redirect_to(@blog, :notice => 'Blog was successfully created.') }
          format.xml  { render :xml => @blog, :status => :created, :location => @blog }
        else
          @users = User.all
          format.html { render :action => "new" }
          format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /blogs/1
    # PUT /blogs/1.xml
    def update
      @blog = Blog.find(params[:id])

      respond_to do |format|
        if @blog.update_attributes(params[:blog])
          format.html { redirect_to(@blog, :notice => 'Blog was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /blogs/1
    # DELETE /blogs/1.xml
    def destroy
      @blog = Blog.find(params[:id])
      @blog.destroy

      respond_to do |format|
        format.html { redirect_to(blogs_url) }
        format.xml  { head :ok }
      end
    end
  end
end
