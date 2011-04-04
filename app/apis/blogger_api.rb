module BloggerStructs
  class Blog < ActionWebService::Struct
    member :url, :string
    member :blogid, :string
    member :blogName, :string
  end
end

class BloggerApi <  ActionWebService::API::Base
  inflect_names false

  api_method :getUsersBlogs,
  :expects => [ {:appkey => :string}, {:username => :string}, {:password => :string} ],
  :returns => [[BloggerStructs::Blog]]
end
