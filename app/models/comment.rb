class Comment < ActiveRecord::Base
  unloadable
  include AASM

  acts_as_nested_set :scope => [:commentable_id, :commentable_type]

  belongs_to :commentable, :polymorphic => true

  default_scope :order => 'created_at ASC'

  scope :needs_moderation, where("status in (?, ?)", 'unreviewed', 'probable_spam')

  def state
    self.aasm_current_state
  end
  alias_attribute :comment, :body

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # Helper class method that allows you to build a comment
  # by passing a commentable object, a user_id, and comment text
  # example in readme
  def self.build_from(obj, user_id, comment)
    c = self.new
    c.commentable_id = obj.id
    c.commentable_type = obj.class.name
    c.body = comment
    c.user_id = user_id
    c
  end

  #helper method to check if a comment has children
  def has_children?
    self.children.size > 0
  end

  # Helper class method to lookup all comments assigned
  # to all commentable types for a given user.
  scope :find_comments_by_user, lambda { |user|
    where(:user_id => user.id).order('created_at DESC')
  }

  # Helper class method to look up all comments for
  # commentable class name and commentable id.
  scope :find_comments_for_commentable, lambda { |commentable_str, commentable_id|
    where(:commentable_type => commentable_str.to_s, :commentable_id => commentable_id).order('created_at DESC')
  }

  # Helper class method to look up a commentable object
  # given the commentable class name and id
  def self.find_commentable(commentable_str, commentable_id)
    commentable_str.constantize.find(commentable_id)
  end

  def auto_approve?
    return user.auto_approve_comment?
  end

  # NOTE: Comments belong to a user
  belongs_to :user

  aasm_initial_state :unreviewed
  aasm_state :unreviewed
  aasm_state :probable_spam
  aasm_state :approved
  aasm_state :rejected

  aasm_event :approve do
    transitions :to => :approved, :from => [:unreviewed, :rejected]
  end

  aasm_event :reject do
    transitions :to=> :rejected, :from => [:unreviewed, :approved, :rejected]
  end

  def state= value
    #since it's not a good idea to send arbitrary messages from a client, I verify that
    #the specified state is an allowed transition before sending the message.
    self.send(value) if value.in? aasm_events_for_current_state
  end
end
