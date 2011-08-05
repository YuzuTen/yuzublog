source 'http://rubygems.org'

#gem 'rails'
# Bundle edge Rails instead:
gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'jquery-rails'

#file upload/attachments
gem 'paperclip', :git => 'git://github.com/thoughtbot/paperclip.git'

#web services features
gem 'rubyjedi-soap4r'
#gem 'actionwebservice', :git=> ':git => 'https://github.com/mkoentopf/actionwebservice.git'

#Middleware solution that injects google analytics script just before </body>
gem 'rack-google_analytics', :require => "rack/google_analytics"

gem 'acts_as_commentable', :git => 'https://github.com/jackdempsey/acts_as_commentable.git'

#Pagination support
gem 'will_paginate', :git=>'https://github.com/JackDanger/will_paginate.git'

#Web server dependencies
gem 'thin'

# Deploy with Capistrano
# gem 'capistrano'


# Bundle the extra gems:
# gem 'bj'
gem 'nokogiri'

gem 'aws-s3', :require => 'aws/s3'

#authentication
gem 'devise'#, :git => 'https://github.com/plataformatec/devise.git'

#oath enables facebook login, for one
#gem 'omniauth'#, :git => 'https://github.com/intridea/omniauth.git'
#gem 'oa-oauth', :require => "omniauth/oauth"

#openid enables google login, and openid generally
#gem 'oa-openid', :require => 'omniauth/openid'
#authorization
gem 'cancan'


#Plugins for application features
gem 'acts-as-taggable-on', :git => 'https://github.com/mbleigh/acts-as-taggable-on.git'

#acts as state machine enables transitions between things that should behave differently depending on their, well, state
gem 'aasm', :git=>'https://github.com/rubyist/aasm'

gem 'friendly_id'

#needed for Heroku; Imagemagick is enough on a local machine, apparently
gem 'rmagick'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'wirble'
  gem 'ruby-debug19'
  gem 'rspec'
  gem 'cucumber'  
  #  gem 'mongrel' not working for me
  gem 'webrat'
  # Use unicorn as the web server
  gem 'unicorn'

end

