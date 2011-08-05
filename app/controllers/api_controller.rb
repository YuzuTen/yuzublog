if defined? ::ActionWebService
  class ApiController < ApplicationController
    acts_as_web_service
    web_service_dispatching_mode :layered

    skip_before_filter :verify_authenticity_token

    web_service :metaWeblog, MetaweblogService.new(self)
    web_service :blogger, BloggerService.new(self)

  #  web_service_scaffold :index

    # def index
    #   render :html=> :methods
    # end

    def xmlrpc
      api
    end

    def api
      dispatch_web_service_request
    end

    def services
      render :xml => ['']
    end
    #   render :xml=>['hello there']
    # end
    # # This method will be exposed externally as "metaWeblog.newPost()"
    # def new_post(blogid, username, password, struct, publish)
    #   puts 'coming soon'
    # end

    # def get_categories(blogid, username, password)
    #   render :xml => Categories.all
    # end

    # def add_category(blogid,username,password)
    # end

    # def get_recent_posts(blogid, username, password)
    # end

    # def edit_post(blogid, username, password, struct, publish)
    # end

    # """some method for some simple idea"""
    # def hello_world
    #   logger.debug 'hello_world action invoked'
    #   render :xml =>[ 'hello world']
    # end

  end
end
