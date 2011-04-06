class MetaweblogService < ParameterizedAuthBasedService
  web_service_api MetaweblogApi

  attr_accessor :controller

  def identify_blog(blogid)
    @blog=Blog.find_by_id(blogid) 
  end

  def initialize(controller)
    @controller = controller
  end

  def this_blog
    controller.send(:this_blog)
  end

  def newPost(blogid,username,password,struct,publish)
    identify_blog(blogid)
    post=Post.new(:story => struct.description, :title => struct.title, :blog => @blog, :categories=>struct.categories)
    post.save
    post.id
  end

  def editPost(postid,username,password,struct,publish)
    post=Post.find_by_id(postid)
    post.story=struct.description
    post.title=struct.title
    post.categories=struct.categories
    
    post.save
  end

  def getPost(postid,username,password)
    post=Post.find_by_id(postid)
    post_dto_from(post)
  end

  def newMediaObject(blogid,username,password,struct)
    #returns struct
  end
  
  def getCategories(blogid,username,password)
    #returns struct (description,htmlUrl,rssUrl)
    Post.tag_counts_on(:categories).map { |c| MetaweblogStructs::Category.new(:description => c.name,:title => c.name, :htmlUrl => "/#{c.name}", :rssUrl => "/#{c.name}.rss")  }
  end

  def getRecentPosts(blogid,username,password,numberOfPosts)
    #returns array of structs
    Post.find(:all).collect { |p| post_dto_from(p) }
  end

  def post_dto_from(post)
    MetaweblogStructs::Article.new(
                                   :description       => post.story,
                                   :title             => post.title,
                                   :postid            => post.id.to_s,
                                   :url               => post.permalink_url(only_path=false),
                                   :link              => post.permalink_url(only_path=false),
                                   :permaLink         => post.permalink_url(only_path=false),
                                   :categories        => post.categories.collect { |c| c.name },
                                   :mt_text_more      => '',#post.extended.to_s,
                                   :mt_excerpt        => '',# post.excerpt.to_s,
                                   :mt_keywords       => post.tag_counts_on(:categories).collect { |p| p.name }.join(', '),
                                   :mt_allow_comments => 1 ,#post.allow_comments? ? 1 : 0,
                                   :mt_allow_pings    => 0,#post.allow_pings? ? 1 : 0,
                                   :mt_convert_breaks => '',# (post.text_filter.name.to_s rescue ''),
                                   :mt_tb_ping_urls   => [],#post.pings.collect { |p| p.url },
                                   :dateCreated       => (post.publish_on)
                                   )
  end

end
