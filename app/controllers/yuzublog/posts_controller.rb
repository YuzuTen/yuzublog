module Yuzublog
  class PostsController < ApplicationController
    unloadable
#    layout 'refinery/admin', :only => [:new, :edit]
    before_filter :authenticate_user!, :except =>  [ :index, :show ]

    load_resource
    before_filter :find_blog, :except => [:show, :edit]
    before_filter :set_blog_from_post, :only => [:show, :edit]

  #  authorize_resource :through=>:blog

    before_filter :load_tags

    protected
    def set_blog_from_post
      #We figure out which blog we are in using
      @blog=@post.blog if @blog.nil?
    end

    def load_tags
      @categories = @blog.posts.tag_counts_on(:categories)
    end

    public
    # GET /posts
    # GET /posts.xml
    def index
      @posts=@blog.posts.paginate(:per_page=>10,:page => params[:page], :order => 'publish_on DESC, created_at DESC')

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @posts }
      end
    end

    def tags
      @posts=@blog.posts.tagged_with(params[:tags]).paginate(:per_page=>10,:page => params[:page], :order => 'publish_on DESC, created_at DESC')
      respond_to do |format|
        format.html
        format.xml  { render :xml => @posts }
      end
    end
    # GET /posts/1
    # GET /posts/1.xml
    def show

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @post }
      end
    end

    # GET /posts/new
    # GET /posts/new.xml
    def new
      @post = @blog.posts.new(:active_user => current_user)
      @post.post_images.build
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @post }
      end
    end

    # GET /posts/1/edit
    def edit
      @post = @blog.posts.find(params[:id])
      @post.post_images.build
    end

    # POST /posts
    # POST /posts.xml

    def create
      params[:post][:active_user]= current_user
      @post = @blog.posts.new(params[:post])

      logger.info("Post belongs to #{@post.blog}")

      respond_to do |format|
        if @post.save
          format.html { redirect_to([@blog,@post], :notice => 'Post was successfully created.') }
          format.xml  { render :xml => @post, :status => :created, :location => @post }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /posts/1
    # PUT /posts/1.xml
    def update
      params[:post][:active_user]= current_user

      @post = @blog.posts.find(params[:id])

      respond_to do |format|
        logger.debug "Post_images: #{ params[:post]}"
        if @post.update_attributes(params[:post])
          format.html { redirect_to([@blog,@post], :notice => 'Post was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /posts/1
    # DELETE /posts/1.xml
    def destroy
      @post = @blog.posts.find(params[:id])
      @post.destroy

      respond_to do |format|
        format.html { redirect_to(posts_url) }
        format.xml  { head :ok }
      end
    end
  end
end
