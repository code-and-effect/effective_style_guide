require 'haml-rails'
require 'effective_style_guide/engine'
require 'effective_style_guide/version'

module EffectiveStyleGuide
  # The following are all valid config keys
  mattr_accessor :authorization_method
  mattr_accessor :layout

  def self.setup
    yield self
  end

  def self.authorized?(controller, action, resource)
    if authorization_method.respond_to?(:call) || authorization_method.kind_of?(Symbol)
      raise Effective::AccessDenied.new() unless (controller || self).instance_exec(controller, action, resource, &authorization_method)
    end
    true
  end

  def self.colors
    ['red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet', 'black', 'white', 'gray']
  end

  def self.foods
    ['Coffee', 'Tea', 'Soda']
  end

end
