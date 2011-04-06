class Blog < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  has_many :posts
  has_and_belongs_to_many :authors, :class_name => "User"

  validates_presence_of :name
  default_url_options[:host]='http://test.yuzuten.com:3000'
  
  def url
    blog_url(self)
  end
end
