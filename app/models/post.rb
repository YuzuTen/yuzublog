class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :created_by, :class_name => 'User'
  belongs_to :updated_by, :class_name => 'User'

  before_create :set_created_by
  before_update :set_updated_by

  attr_accessor :active_user
  
  validates_presence_of :title
  validates_presence_of :story

  has_many :post_images, :dependent => :destroy, :class_name => 'PostImage'

  accepts_nested_attributes_for :post_images, :reject_if => lambda { |i| i[:photo].blank? }

  acts_as_taggable_on :categories

  scope :published, lambda {
    where("posts.publish_on is not null and posts.publish_on <= ?", Time.zone.now)
  }
  
  scope :recent, published.order("posts.publish_on DESC")

  def set_created_by
    #if explicitly set, don't override the created_by user
    self.created_by ||= @active_user
  end

  def set_updated_by
    #updated_by should always reflect the actual user who did the update
    self.updated_by = @active_user
  end

  def permalink_url(*params)
    return 'test only'#link_to(:blog_id=>blog_id,:post_id=>self.id)
  end
end
