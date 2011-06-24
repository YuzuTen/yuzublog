module Yuzublog
  class PostsController < ApplicationController
    unloadable

    before_filter :authenticate_user!, :except =>  [ :index, :show ]
    before_filter :find_blog

#    authorize_resource :through=>:blog
    protected
    def tag_cloud
      @categories = Post.tag_counts_on(:categories)
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

    # GET /posts/1
    # GET /posts/1.xml
    def show
      @post = @blog.posts.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @post }
      end
    end

    # GET /posts/new
    # GET /posts/new.xml
    def new
      @post = Post.new(:active_user => current_user)
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
      @post = @blog.posts.new(params[:post])

      logger.info("Post belongs to #{@post.blog}")

      respond_to do |format|
        if @post.save
          format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
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
          format.html { redirect_to([@post], :notice => 'Post was successfully updated.') }
          fomarmat.xml  { head :ok }
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
