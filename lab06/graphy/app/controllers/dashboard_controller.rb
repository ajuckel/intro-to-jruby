class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def view
    # ObjectSpace.each_object do |s|
      # not actually doing anything in here.  Just laying a trap
    # end
    @action_plan = current_user.user_action_items
    @metrics = Metric.order(:name).all
  end
end
