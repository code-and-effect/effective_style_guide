module Effective
  class StyleGuideController < ApplicationController
    layout EffectiveStyleGuide.layout || 'application'

    def show
      @style_guide = StyleGuide.new(:id => 1)
      @invalid_style_guide = StyleGuide.new(:id => 2).tap { |ks| ks.valid? }

      @partials = view_paths.map { |path| Dir["#{path}/effective/style_guide/_**"] }.flatten.compact.reverse

      if defined?(EffectiveDatatables)
        @datatable = Effective::Datatables::StyleGuide.new()
      end

      @page_title ||= 'Style Guide'

      EffectiveOrders.authorized?(self, :show, @style_guide)

    end

  end
end
