class UserActionItemsController < ApplicationController
  before_filter :authenticate_user!
  def update
    user_action_items = params[:user_action_item]
    week_number = params[:week_number]
    user_action_items.each_pair do |key, ratings|
      logger.debug "Week: #{week_number}; Action Item #{key}: #{ratings.to_json}"
      uai = UserActionItem.where(:user_id => current_user.id).find(key)
      Rating.delete(Rating.where(:user_action_item_id => uai).where(:week_number => params[:week_number]).all)
      ratings.each do |rating|
        logger.debug "Rating: #{rating.to_json}; metric: #{Metric.find(rating.first).id}"
        r = Rating.new
        r.user_action_item = uai
        r.week_number = week_number
        r.metric = Metric.find(rating.first)
        r.pros = rating.second["pros"]
        r.cons = rating.second["cons"]
        r.value = rating.second["value"]
        uai.ratings << r
      end
    end
    render(:json => { :result => "success" }.to_json)
  end
end
