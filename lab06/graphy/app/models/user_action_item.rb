class UserActionItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :action_item
  has_many :ratings
  has_many :metrics, :through => :ratings
  accepts_nested_attributes_for :ratings
  def rating_for metric, week
    self.ratings.detect { |r| r.metric == metric && r.week_number == week }
  end
end

