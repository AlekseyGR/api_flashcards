$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "api_flashcards/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "api_flashcards"
  s.version     = ApiFlashcards::VERSION
  s.authors     = ["AlekGR"]
  s.email       = ["alek.grischenko@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ApiFlashcards."
  s.description = "TODO: Description of ApiFlashcards."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.5.1"

  s.add_development_dependency "pg"
end
