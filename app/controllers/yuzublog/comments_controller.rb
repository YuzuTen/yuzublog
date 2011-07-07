class Yuzublog::CommentsController < ApplicationController
  unloadable
  
  before_filter :identify_post

  protected
  def identify_post
    @post=Post.find(params[:post_id])
  end

  public
  # GET /comments
  # GET /comments.xml
  def index
    @comments=@post.comments.paginate(:per_page=>25,:page => params[:page], :order => 'created_at DESC')
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end
  
    # GET /comments/1
    # GET /comments/1.xml
  def show
    @comment =@post.comments.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment=@post.comments.build(:user_id=>current_user)
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end
  
  # GET /comments/1/edit
  def edit
    @post.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  
  def create
    params[:comment][:user_id]= current_user
    @comment=@post.comments.create(params[:comment])
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to([@blog,@post], :notice => 'Thank you for your comment!') }
        format.xml  { render :xml => @post, :status => :created, :location => [@blog,@post] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    params[:comment][:user_id]= current_user
    
    @comment=@post.comments.find(params[:id])
    
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to([@blog,@post], :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment=@post.comments.find(params[:id])
    
    @comment.destroy # if (current_user.id=@comment.user_id && comment.created_at < 5.minutes.ago) 
    
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
