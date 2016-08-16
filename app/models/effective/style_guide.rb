module Effective
  class StyleGuide
    include ActiveModel::Model

    if defined?(EffectiveAssets)
      acts_as_asset_box files: 1..6
    end

    ATTRIBUTES = [
      :id, :title, :email, :password, :number, :range, :category, :content,
      :archived, :drink, :food, :price, :updated_at, :publish_on, :static_text
    ]

    attr_accessor *ATTRIBUTES
    validates *ATTRIBUTES, presence: true

    def static_text
      'some static text'
    end

  end
end
