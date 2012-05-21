class ActionItemsController < ApplicationController
  before_filter :authenticate_user!
  def add
    item = ActionItem.find(params[:id])
    current_user.add_item_if_new item
    redirect_to action_plans_url
  end
end
