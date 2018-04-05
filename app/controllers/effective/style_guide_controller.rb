module Effective
  class StyleGuideController < ApplicationController
    layout EffectiveStyleGuide.layout || 'application'

    def show
      @partials = if defined?(EffectiveFormInputs)
        view_paths.map { |path| Dir["#{path}/effective/style_guide_bootstrap3/_**"] }.flatten.map do |path|
          name = File.basename(path)
          name[1...name.index('.') || name.length] # remove the _ and .html.haml
        end.uniq.sort
      else
        view_paths.map { |path| Dir["#{path}/effective/style_guide/_**"] }.flatten.map do |path|
          name = File.basename(path)
          name[1...name.index('.') || name.length] # remove the _ and .html.haml
        end.uniq.sort
      end.reject { |p| p.start_with?('_') } # Remove any double __ partials

      @page_title ||= 'Style Guide'

      EffectiveStyleGuide.authorize!(self, :show, Effective::StyleGuide.new())

      render "effective/style_guide#{'_bootstrap3' if defined?(EffectiveFormInputs)}/show"
    end

    def bootstrap3
      @partials = view_paths.map { |path| Dir["#{path}/effective/style_guide_bootstrap3/_**"] }.flatten.map do |path|
        name = File.basename(path)
        name[1...name.index('.') || name.length] # remove the _ and .html.haml
      end.uniq.sort

      @partials = @partials.reject { |p| p.start_with?('_') } # Remove any double __ partials

      @page_title ||= 'Style Guide'

      EffectiveStyleGuide.authorize!(self, :show, Effective::StyleGuide.new())

      render 'effective/style_guide_bootstrap3/show'
    end

  end
end
