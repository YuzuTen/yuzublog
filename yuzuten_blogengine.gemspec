

spec = Gem::Specification.new do |s|
  s.name = 'yuzuten_blogengine'
  s.version = '0.0.1' #YuzutenBlogengine::VERSION
  s.summary = "Obviously the world needs another Rails-based blog engine."
  s.description = "A multisite blogging engine on Rails."
  s.files = Dir['lib/**/*.rb'] + Dir['test/**/*.rb']
  s.require_path = 'lib'
  s.autorequire = 'blogengine'
  s.has_rdoc = true
  s.extra_rdoc_files = Dir['[A-Z]*']
  s.rdoc_options << '--title' <<  'Yuzuten Blogengine'
  s.author = "Jason Truesdell"
  s.email = "jason@yuzuten.com"
  s.homepage = "http://www.yuzuten.com"
end