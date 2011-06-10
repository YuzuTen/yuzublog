class Site < ActiveRecord::Base
  has_many :blogs

  validates_uniqueness_of :hostname
  validates_presence_of :hostname
  #should probably also validate acceptable hostname strings, but this is a little less trivial than it sounds.

  #As a hosted app, we'll probably want some provisioning rules (so that people can't 
  #provision "admin.yourdomain.com" when it's not allowed. I'll deal with that a little later.

end
