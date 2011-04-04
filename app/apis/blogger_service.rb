class BloggerService < ActionWebService::Base
  web_service_api BloggerApi
  attr_accessor :controller

  def initialize(controller)
    @controller = controller
  end

  def this_blog
    controller.send(:this_blog)
  end

  def getUsersBlogs(appkey,username,password)
    user=User.find_by_email(username)
    # member :url, :string
    # member :blogid, :string
    # member :blogName, :string
    user.blogs.map{|blog| BloggerStructs::Blog.new(:url=>blog.url,:blogid=>blog.id,:blogName=>blog.name)}
  end
end
