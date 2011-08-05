files = ::Dir[
  '[a-zA-Z]*',
  'db/migrate/*',
  'db/seeds.rb',
  'generators/**/*',
  'lib/**/*',
  'app/**/*',
  'tasks/**/*',
  'test/**/*'
]


spec = Gem::Specification.new do |s|
  s.name = 'yuzublog'
  s.version = '0.0.1' #YuzutenBlogengine::VERSION
  s.summary = "Obviously the world needs another Rails-based blog engine."
  s.description = "A multisite blogging engine on Rails."
  s.files = files.to_a
  s.require_path = 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = Dir['[A-Z]*']
  s.rdoc_options << '--title' <<  'Yuzublog: A blog engine by YuzuTen LLC'
  s.author = "Jason Truesdell"
  s.email = "jason@yuzuten.com"
  s.homepage = "http://www.yuzuten.com"
  s.add_dependency('rails')
  s.add_dependency('acts-as-taggable-on')
  s.add_dependency('rmagick')
  s.add_dependency('omniauth')
  s.add_dependency('devise')
  s.add_dependency('cancan')
  s.add_dependency('acts_as_commentable')
  s.add_dependency('aasm')
end