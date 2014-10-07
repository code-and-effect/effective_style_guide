module Effective
  class StyleGuide < ActiveRecord::Base
    def self.columns
      @columns ||= [];
    end

    def self.column(name, sql_type = nil, default = nil, null = true)
      columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
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

    validates_presence_of :title, :email, :password, :number, :range, :category, :content, :archived, :drink, :food

  end
end
