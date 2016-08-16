module Effective
  class StyleGuide
    include ActiveModel::Model

    if defined?(EffectiveAssets)
      acts_as_asset_box files: 1..6
    end

    attr_accessor :id, :title, :email, :password, :number, :range, :category, :content
    attr_accessor :archived, :drink, :food, :price, :updated_at, :publish_on, :static_text


    # column :id, :integer

    # column :title, :string
    # column :email, :string
    # column :password, :string
    # column :number, :integer
    # column :range, :integer
    # column :category, :string
    # column :content, :text
    # column :archived, :boolean
    # column :drink, :string
    # column :food, :string
    # column :price, :integer
    # column :updated_at, :datetime
    # column :publish_on, :date
    # column :static_text, :string

    validates :id, :title, :email, :password, :number, :range, :category, :content, presence: true
    validates :archived, :drink, :food, :price, :updated_at, :publish_on, :static_text, presence: true

    def static_text
      'some static text'
    end

  end
end
