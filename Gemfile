source 'http://rubygems.org'

gem 'rails', '3.0.5'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'thin'
gem 'cancan'
gem 'paperclip', :git => 'git://github.com/thoughtbot/paperclip.git'
gem 'rubyjedi-soap4r'
gem 'actionwebservice', :git => 'https://github.com/mkoentopf/actionwebservice.git'

gem 'rack-google_analytics', :require => "rack/google_analytics"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
gem 'nokogiri'

gem 'aws-s3', :require => 'aws/s3'

gem 'devise', :git => 'https://github.com/plataformatec/devise.git'

#oath enables facebook login, for one
gem 'omniauth', :git => 'https://github.com/intridea/omniauth.git'
gem 'oa-oauth', :require => "omniauth/oauth"

#openid enables google login, and openid generally
gem 'oa-openid', :require => 'omniauth/openid'

gem 'acts-as-taggable-on', :git => 'https://github.com/mbleigh/acts-as-taggable-on.git'

#needed for Heroku; Imagemagick is enough on a local machine, apparently
gem 'rmagick'


# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'wirble'
  gem 'ruby-debug19'
  
  #  gem 'mongrel' not working for me
  gem 'webrat'
end
