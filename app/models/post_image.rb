class PostImage < ActiveRecord::Base
  belongs_to :post
#  has_attached_file :photo, :storage=> :s3, :s3_credentials => {  :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'] },
#  :bucket => 'me.yuzuten.com',  :s3_host_alias => 'me.yuzuten.com', :url => ':s3_alias_url', :path => 'post_images/:attachment/:id/:style/:basename.:extension',:styles => { :thumb => '64x64#', :small => '150x150>', :medium => '320x240>', :large => '640x480>' }

  image_accessor :photo

  validates_attachment_presence :photo
  validates_attachment_size :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/pjpeg', 
                                                              'image/jpg', 'image/png']

  validates_presence_of :caption
end
