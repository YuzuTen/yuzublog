class PostImage < ActiveRecord::Base
  belongs_to :post
  has_attached_file :photo, :styles => { :small => '150x150>', :medium => '320x240>', :large => '640x480>' }
  validates_attachment_presence :photo
  validates_attachment_size :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/pjpeg', 
                                   'image/jpg', 'image/png']

  validates_presence_of :caption

end
