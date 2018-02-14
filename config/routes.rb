Rails.application.routes.draw do
  mount EffectiveStyleGuide::Engine => '/', :as => 'effective_style_guide'
end

EffectiveStyleGuide::Engine.routes.draw do
  scope :module => 'effective' do
    match '/styleguide', to: 'style_guide#show', via: [:get, :post, :patch], as: 'style_guide'
    match '/styleguide/bootstrap3', to: 'style_guide#bootstrap3', via: :get
  end
end
