$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "group_me/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "group_me"
  s.version     = GroupMe::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of GroupMe."
  s.description = "TODO: Description of GroupMe."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "nested_scaffold"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
end
