raise 'You should export your S3_KEY and S3_SECRET as environment variables before running rails server' if ENV['S3_KEY'].nil? || ENV['S3_SECRET'].nil?

AWS::S3::Base.establish_connection!(
  :access_key_id     => ENV['S3_KEY'],
  :secret_access_key => ENV['S3_SECRET']
)

