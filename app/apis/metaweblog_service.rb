class MetaweblogService < ActionWebService::Base
  web_service_api MetaweblogApi

  attr_accessor :controller

  def initialize(controller)
    @controller = controller
  end

  def this_blog
    controller.send(:this_blog)
  end


  def hello_world
    "Hello, World"
  end

  def newPost(blogid,username,password,struct,publish)
    #returns string
  end

  def editPost(postid,username,password,struct,publish)
    #returns true
  end

  def getPost(postid,username,password)
    #returns struct matching rss item
  end

  def newMediaObject(blogid,username,password,struct)
    #returns struct
  end
  

  def getCategories(blogid,username,password)
    #returns struct (description,htmlUrl,rssUrl)
#    logger.info "getCategories called"
    Post.tag_counts_on(:categories).collect { |c| c.name }
  end

  def getRecentPosts(blogid,username,password,numberOfPosts)
    #returns array of structs
#    logger.info "getRecentPosts called"

    Post.find(:all).collect { |p| post_dto_from(p) }
  end

  def post_dto_from(post)
    MetaWeblogStructs::Article.new(
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
