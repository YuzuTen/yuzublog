class Blog < ActiveRecord::Base
  has_many :posts
  has_and_belongs_to_many :authors, :class_name => "User"

  validates_presence_of :name
end
