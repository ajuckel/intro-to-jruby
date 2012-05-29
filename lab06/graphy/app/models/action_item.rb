class ActionItem < ActiveRecord::Base
  attr_accessible :description, :name, :action_category_id
  belongs_to :action_category
  has_many :user_action_items
  has_many :users, :through => :user_action_items
end
