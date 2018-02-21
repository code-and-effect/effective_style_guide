module Effective
  class StyleGuide
    include ActiveModel::Model

    if defined?(EffectiveAssets)
      acts_as_asset_box files: 1..6
    end

    ATTRIBUTES = [
      :id, :title, :email, :password, :number, :range, :category, :content, :phone, :fax, :cell,
      :url, :color, :option1, :option2, :option3, :details,
      :archived, :drink, :food, :price, :updated_at, :publish_on, :static_text,
      :start_at, :end_at, :date, :time
    ]

    attr_accessor *ATTRIBUTES
    validates *ATTRIBUTES, presence: true

    def id
      object_id
    end

    def static_text
      'some static text'
    end

  end
end
