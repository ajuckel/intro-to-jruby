class ActionCategory < ActiveRecord::Base
  attr_accessible :name
  has_many :action_items
end
