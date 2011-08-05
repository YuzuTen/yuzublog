class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :created_by, :class_name => 'User'
  belongs_to :updated_by, :class_name => 'User'
  after_initialize :init

  has_friendly_id :title, :use_slug => true, :scope => :blog_id,
    :default_locale => :en,
    :reserved_words => %w(index new session login logout users refinery admin images wymiframe)

  acts_as_commentable

  before_create :set_created_by
  before_update :set_updated_by
  before_save :set_publish_date

  attr_accessor :active_user

  validates_presence_of :title
  validates_presence_of :story

  validates_presence_of :blog_id
  validates_presence_of :active_user

  has_many :post_images, :dependent => :destroy, :class_name => 'PostImage'

  accepts_nested_attributes_for :post_images, :reject_if => lambda { |i| i[:photo].blank? }


  acts_as_taggable_on :categories

  scope :published, lambda {
    where("posts.publish_on is not null and posts.publish_on <= ?", Time.zone.now)
  }
  scope :recent, published.order("posts.publish_on DESC")
  scope :draft, lambda { where("post.publish_on is null") }


  attr_accessor :publish_status
  protected
  def init
    self.publish_status ||= 'published'
  end

  def set_publish_date
    logger.info("Publish Status: #{self.publish_status}")
    self.publish_on=nil if publish_status=='draft'
    self.publish_on ||= DateTime.now if publish_status=='published'
  end

  public

  def draft?
    publish_on.nil?
  end


  def published?
    publish_on.nil?
  end

  def set_created_by
    #if explicitly set, don't override the created_by user
    self.created_by ||= @active_user
  end

  def set_updated_by
    #updated_by should always reflect the actual user who did the update
    self.updated_by = @active_user
  end

  attr_accessor :publish_status

  def permalink_url(*params)
    return 'test only'#link_to(:blog_id=>blog_id,:post_id=>self.id)
  end
end