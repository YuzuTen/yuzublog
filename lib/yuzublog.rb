require 'rails'
require 'acts-as-taggable-on'
require 'rmagick'
require 'omniauth'
require 'devise'
require 'cancan'

unless defined? Yuzublog::Application
  module Yuzublog
    #    BlogEngine.root = Pathname.new(File.expand_path('../../', __FILE__))
    # module Controllers
    #   autoload :Helpers, File 'controllers/helpers'
    # end
    class Engine < ::Rails::Engine
#      config.mount_at = '/'
      isolate_namespace ::Yuzublog::Engine
      
      initializer "static assets" do |app|
        app.middleware.use ::ActionDispatch::Static, "#{root}/public"
      end
      
    end

  end
end


