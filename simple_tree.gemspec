$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_tree/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_tree"
  s.version     = SimpleTree::VERSION
  s.authors     = ["Nikolay Rozhkov"]
  s.email       = ["nrozhkov@at-consulting.ru"]
  s.homepage    = "https://github.com/nirname/simple_tree.git"
  s.summary     = "SimpleTree html tree render"
  s.description = "SimpleTree provides you styles and helpers for drawing html tree"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0.beta1"
  s.add_dependency "jquery-rails", "~> 2.2.1"

  #group :assets do
  #s.add_dependency 'sass-rails',   '~> 4.0.0.beta1'
  #s.add_dependency 'coffee-rails', '~> 4.0.0.beta1'
  #end

  #s.add_development_dependency "sqlite3"
end
