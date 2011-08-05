if defined? ::ActionWebService
  module MetaweblogStructs
    class Article < ::ActionWebService::Struct
      member :description,        :string
      member :title,              :string
      member :postid,             :string
      member :url,                :string
      member :link,               :string
      member :permaLink,          :string
      member :categories,         [:string]
      member :mt_text_more,       :string
      member :mt_excerpt,         :string
      member :mt_keywords,        :string
      member :mt_allow_comments,  :int
      member :mt_allow_pings,     :int
      member :mt_convert_breaks,  :string
      member :mt_tb_ping_urls,    [:string]
      member :dateCreated,        :time
    end

    class Category < ::ActionWebService::Struct
      member :title, :string
      member :description, :string
      member :htmlUrl, :string
      member :rssUrl, :string
    end

    class MediaObject < ::ActionWebService::Struct
      member :bits, :string
      member :name, :string
      member :type, :string
    end

    class Url < ::ActionWebService::Struct
      member :url, :string
    end
  end

  class MetaweblogApi < ::ActionWebService::API::Base
    inflect_names false

    api_method :getCategories,
    :expects => [ {:blogid => :string}, {:username => :string}, {:password => :string} ],
    :returns => [[MetaweblogStructs::Category]]

    api_method :getRecentPosts,
      :expects => [ {:blogid => :string}, {:username => :string}, {:password => :string}, {:numberOfPosts => :int} ],
      :returns => [[MetaweblogStructs::Article]]

    api_method :newPost,
    :expects => [ {:blogid => :string}, {:username => :string}, {:password => :string}, {:struct => MetaweblogStructs::Article}, { :publish=>:string} ],
      :returns => [:string]

    api_method :editPost,
    :expects => [ {:postid => :string}, {:username => :string}, {:password => :string}, {:struct => MetaweblogStructs::Article}, { :publish=>:string} ],
      :returns => [:bool]

    api_method :getPost,
    :expects => [ {:id => :string}, {:username => :string}, {:password => :string} ],
      :returns => [MetaweblogStructs::Article]
  end
end