module Effective
  class StyleGuideController < ApplicationController
    layout EffectiveStyleGuide.layout || 'application'

    def show
      @partials = view_paths.map { |path| Dir["#{path}/effective/style_guide/_**"] }.flatten.map do |path|
        name = File.basename(path)
        name[1...name.index('.') || name.length] # remove the _ and .html.haml
      end.uniq.sort

      @partials.delete('effective_datatable') unless defined?(EffectiveDatatables)

      @page_title ||= 'Style Guide'

      EffectiveStyleGuide.authorized?(self, :show, Effective::StyleGuide.new())
    end

  end
end
