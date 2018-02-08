Rails.application.routes.draw do
  mount EffectiveStyleGuide::Engine => '/', :as => 'effective_style_guide'
end

EffectiveStyleGuide::Engine.routes.draw do
  scope :module => 'effective' do
    match '/styleguide', to: 'style_guide#show', via: :get, as: 'style_guide'
  end
end
