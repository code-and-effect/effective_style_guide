module Effective
  class StyleGuide < ActiveRecord::Base
    acts_as_asset_box files: 1..6

    ATTRIBUTES = [
      :id, :title, :email, :password, :number, :range, :category, :content, :phone, :fax, :cell,
      :url, :color, :option1, :option2, :option3, :details,
      :archived, :drink, :food, :price, :updated_at, :publish_on, :static_text,
      :start_at, :end_at, :date, :time
    ]

    attr_accessor *ATTRIBUTES
    validates *ATTRIBUTES, presence: true

    def initialize(*args)
      super

      self.color = 'black'
    end

    def id
      object_id
    end

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
