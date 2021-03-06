module EffectiveStyleGuide
  class Engine < ::Rails::Engine
    engine_name 'effective_style_guide'

    # Set up our default configuration options.
    initializer "effective_style_guide.defaults", :before => :load_config_initializers do |app|
      eval File.read("#{config.root}/config/effective_style_guide.rb")
    end

    initializer 'effective_style_guide.assets' do |app|
      Rails.application.config.assets.precompile += ['placeholder.png']
    end

  end
end
