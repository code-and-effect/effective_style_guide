module EffectiveStyleGuide
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Creates an EffectiveStyleGuide initializer in your application.'
      source_root File.expand_path('../../templates', __FILE__)

      def copy_initializer
        template ('../' * 3) + 'config/effective_style_guide.rb', 'config/initializers/effective_style_guide.rb'
      end
    end
  end
end
