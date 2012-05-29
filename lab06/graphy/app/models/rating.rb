class Rating < ActiveRecord::Base
  belongs_to :user_action_item
  belongs_to :metric
  scope :for_user, lambda { |user_id|
    includes(:user_action_item).includes(:metric).where('user_action_items.user_id' => user_id).order(:week_number)
  }
  # attr_accessible :title, :body
end
