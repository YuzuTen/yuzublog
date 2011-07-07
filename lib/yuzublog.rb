require 'rails'
require 'acts-as-taggable-on'
require 'rmagick'
require 'omniauth'
require 'devise'
require 'cancan'

unless defined? Yuzublog::Application
  module Yuzublog
    class Engine < ::Rails::Engine
      isolate_namespace ::Yuzublog::Engine
      
      initializer "static assets" do |app|
        app.middleware.use ::ActionDispatch::Static, "#{root}/public"
      end
    end
  end
end


