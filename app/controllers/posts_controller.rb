class PostsController < ApplicationController
  before_filter :authenticate_user!, :except =>  [ :index, :show ]
  before_filter :extract_blog
  load_and_authorize_resource :through => :blog

  def tag_cloud
    @categories = Post.tag_counts_on(:categories)
  end

  protected
  def extract_blog
    @blog = Blog.find(params[:blog_id])
  end

  
  public
  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.find_all_by_blog_id(params[:blog_id], :order => 'publish_on DESC, created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

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
    @post = Post.find(params[:id])
    @post.post_images.build
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])
    @post.blog=@blog

    respond_to do |format|
      if @post.save
        format.html { redirect_to([@blog,@post], :notice => 'Post was successfully created.') }
        format.xml  { render :xml => [@blog,@post], :status => :created, :location => @post }
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

    @post = Post.find(params[:id])
    @post.blog=@blog

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
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(blog_posts_url) }
      format.xml  { head :ok }
    end
  end
end
