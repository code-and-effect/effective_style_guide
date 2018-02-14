require 'faker'
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
    @_exceptions ||= [Effective::AccessDenied, (CanCan::AccessDenied if defined?(CanCan)), (Pundit::NotAuthorizedError if defined?(Pundit))].compact

    return !!authorization_method unless authorization_method.respond_to?(:call)
    controller = controller.controller if controller.respond_to?(:controller)

    begin
      !!(controller || self).instance_exec((controller || self), action, resource, &authorization_method)
    rescue *@_exceptions
      false
    end
  end

  def self.authorize!(controller, action, resource)
    raise Effective::AccessDenied unless authorized?(controller, action, resource)
  end

  def self.colors
    ['red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet', 'black', 'white', 'gray']
  end

  def self.foods
    ['bacon', 'eggs', 'hash browns']
  end

  def self.drinks
    ['Coffee', 'Tea', 'Soda']
  end

  def self.grouped_colors
    {
      'Top' => [['red', 'red'], ['orange', 'orange'], ['yellow', 'yellow']],
      'Middle' => [['green', 'green'], ['blue', 'blue'], ['indigo', 'indigo']],
      'Bottom' => [['violet', 'violet']]
    }
  end

end
