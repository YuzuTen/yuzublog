xml.instruct!
xml.rsd(:version => "1.0", :xmlns => "http://archipelago.phrasewise.com/rsd") do
  xml.service do
    xml.engineName("YuzuTen Blog Engine")
    xml.engineLink("http://www.yuzuten.com/about")
    xml.homePageLink(blog_url @blog)
    xml.apis do
      xml.api(:name => "MetaWeblog", :preferred => true, :apiLink => api_url, :blogID => @blog.id)
    end
  end
end
