module Effective
  class StyleGuide < ActiveRecord::Base
    acts_as_asset_box files: 1..6

    ATTRIBUTES = [
      :id, :title, :email, :password, :number, :range, :category, :content, :phone,
      :archived, :drink, :food, :price, :updated_at, :publish_on, :static_text
    ]

    attr_accessor *ATTRIBUTES
    validates *ATTRIBUTES, presence: true

    def self.columns
      @columns ||= []
    end

    def self.column_defaults
      {}
    end

    def self.has_attribute?(*args)
      false
    end

    def static_text
      'some static text'
    end

  end
end
