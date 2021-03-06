$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'effective_style_guide/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'effective_style_guide'
  s.version     = EffectiveStyleGuide::VERSION
  s.email       = ['info@codeandeffect.com']
  s.authors     = ['Code and Effect']
  s.homepage    = 'https://github.com/code-and-effect/effective_style_guide'
  s.summary     = 'Ensure that your custom CSS theme looks good with all Twitter Bootstrap4 (and 3) html components.'
  s.description = 'Ensure that your custom CSS theme looks good with all Twitter Bootstrap4 (and 3) html components.'
  s.licenses    = ['MIT']

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'README.md']

  s.add_dependency 'rails', '>= 4.1.0'
  s.add_dependency 'faker'
end
