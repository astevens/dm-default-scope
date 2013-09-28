Gem::Specification.new do |gem|
  gem.name              = "dm-default-scope"
  gem.version           = "0.0.1"
  gem.summary           = "Default scope in datamapper"
  gem.description       = "Default scope in datamapper"
  gem.authors           = ["CarlosIPe"]
  gem.email             = ["carlos2@compendium.com.ar"]
  gem.homepage          = "http://github.com/carlosipe/dm-default-scope"
  gem.files = ["LICENSE","README.md","lib/dm-default-scope.rb",".gemspec"]

  gem.add_runtime_dependency('dm-core', '<= 1.2')
end