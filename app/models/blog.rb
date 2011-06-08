class Blog < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  has_many :posts
  has_and_belongs_to_many :authors, :class_name => "User"

  validates_uniqueness_of :subdomain, :scope => [:subdomain, :domain]
  validates_presence_of :subdomain

  validates_exclusion_of :subdomain, :in=> %w(admin, test),
                         :message => 'is unavailable.'
  validates_presence_of :name

  belongs_to :site
  
  default_url_options[:host]=site.hostname
  
  def url
    blog_url(self)
  end
end
