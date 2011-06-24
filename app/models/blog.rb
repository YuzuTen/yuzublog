class Blog < ActiveRecord::Base
  unloadable
  include Rails.application.routes.url_helpers

  has_many :posts
  has_and_belongs_to_many :authors, :class_name => "User"

  belongs_to :site, :class_name => "::Site"
  
  validates_presence_of :name
  validates_presence_of :slug
  validates_presence_of :description

  def default_hostname
    return nil if site.nil?
    if defined? site.hostnames
      site.hostnames.first
    else
      site.hostname
    end
  end

  # default_url_options[:host]=self.hostname
  def self.find_by_hostname(hostname)
    site=Site.find_by_hostname(hostname)
    if site.nil?
      raise ActiveRecord::RecordNotFound
    else
      site.blogs
    end
  end
  
  def url
    blog_url(self)
  end
end

