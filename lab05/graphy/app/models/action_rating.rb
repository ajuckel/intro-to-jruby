class ActionRating < ActiveRecord::Base
  belongs_to :action_item
  belongs_to :user
  attr_accessible :cons, :pros, :rating
end
