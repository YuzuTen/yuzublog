class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :author

  validates_presence_of :title
  validates_presence_of :story
end
