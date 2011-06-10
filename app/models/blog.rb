class Blog < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  has_many :posts
  has_and_belongs_to_many :authors, :class_name => "User"

  belongs_to :site
  
 # default_url_options[:host]=self.hostname
  def self.find_by_hostname(hostname)
    site=Site.find_by_hostname(hostname)
    if site.nil?
      throw ActiveRecord::RecordNotFound
    else
      site.blogs
    end
  end
  
  def url
    blog_url(self)
  end
end
