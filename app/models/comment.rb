class Comment < ActiveRecord::Base
  unloadable
  include AASM
  include ActsAsCommentable::Comment

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
