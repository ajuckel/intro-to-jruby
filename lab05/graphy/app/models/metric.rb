class Metric < ActiveRecord::Base
  attr_accessible :cons, :description, :max_rating, :min_rating, :name, :pros
  has_many :ratings
  has_many :user_action_items, :through => :ratings
end
