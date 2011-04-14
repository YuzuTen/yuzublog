class PersonalizedPostsController < PostsController 
  protected
  def extract_blog
    @blog = Blog.find_by_subdomain(params[:subdomain])
  end
end

