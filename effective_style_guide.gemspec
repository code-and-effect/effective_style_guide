$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "effective_style_guide/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "effective_style_guide"
  s.version     = EffectiveStyleGuide::VERSION
  s.email       = ["info@codeandeffect.com"]
  s.authors     = ["Code and Effect"]
  s.homepage    = "https://github.com/code-and-effect/effective_style_guide"
  s.summary     = "Ensure that your custom CSS theme looks good with the bootstrap3 components"
  s.description = "Ensure that your custom CSS theme looks good with the bootstrap3 components"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails"
  s.add_dependency "coffee-rails"
  s.add_dependency "haml"
  s.add_dependency "simple_form"
end
