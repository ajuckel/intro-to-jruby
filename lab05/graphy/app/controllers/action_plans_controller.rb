class ActionPlansController < ApplicationController
  before_filter :authenticate_user!
  def index
    @action_plan = current_user.action_items
    @action_categories = ActionCategory.all
  end
end
