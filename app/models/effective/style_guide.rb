module Effective
  class StyleGuide < ActiveRecord::Base
    acts_as_asset_box :files => 1..6 if defined?(EffectiveAssets)

    def self.columns
      @columns ||= []
    end

    def self.column(name, sql_type = nil, default = nil, null = true)
      if Rails.version >= '4.2.0'
        cast_type = "ActiveRecord::Type::#{sql_type.to_s.titleize.sub('Datetime', 'DateTime')}".constantize.new()
        columns << ::ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, cast_type, sql_type.to_s, null)
      else
        columns << ::ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
      end
    end

    column :id, :integer

    column :title, :string
    column :email, :string
    column :password, :string
    column :number, :integer
    column :range, :integer
    column :category, :string
    column :content, :text
    column :archived, :boolean
    column :drink, :string
    column :food, :string
    column :price, :integer
    column :updated_at, :datetime
    column :publish_on, :date
    column :static_text, :string

    validates_presence_of :id, :title, :email, :password, :number, :range, :category, :content, :archived, :drink, :food, :price, :updated_at, :publish_on, :static_text

    def static_text
      'some static text'
    end

  end
end
