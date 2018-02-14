module Effective
  class StyleGuideController < ApplicationController
    layout EffectiveStyleGuide.layout || 'application'

    def show
      @partials = view_paths.map { |path| Dir["#{path}/effective/style_guide/_**"] }.flatten.map do |path|
        name = File.basename(path)
        name[1...name.index('.') || name.length] # remove the _ and .html.haml
      end.uniq.sort

      @partials = @partials.reject { |p| p.start_with?('_') } # Remove any double __ partials

      @page_title ||= 'Style Guide'

      EffectiveStyleGuide.authorized?(self, :show, Effective::StyleGuide.new())
    end

    def bootstrap3
      @partials = view_paths.map { |path| Dir["#{path}/effective/style_guide_bootstrap3/_**"] }.flatten.map do |path|
        name = File.basename(path)
        name[1...name.index('.') || name.length] # remove the _ and .html.haml
      end.uniq.sort

      @partials = @partials.reject { |p| p.start_with?('_') } # Remove any double __ partials

      @page_title ||= 'Style Guide'

      EffectiveStyleGuide.authorized?(self, :show, Effective::StyleGuide.new())

      render 'effective/style_guide_bootstrap3/show'
    end

  end
end
