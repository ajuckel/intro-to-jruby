class ResultsController < ApplicationController
  before_filter :authenticate_user!
  def fetch
    requested_id = params[:user_id]
    u = current_user.id
    if has_access(current_user, requested_id)
      ratings = Rating.for_user(requested_id)
      logger.debug(ratings.to_json)
      ratings_by_metric = {}
      ratings.each do |r|
        ratings_by_metric[r.metric.name] = [] unless ratings_by_metric[r.metric.name]
        ratings_by_metric[r.metric.name] << r
      end
      results = []
      ratings_by_metric.each_pair do |name, ratings|
        rec = { :metric => name, :ratings => ratings.map { |r| [r.week_number, r.value] } }
        results << rec
      end
      render :json => results.to_json
    else
      render :json => [].to_json
    end
  end

  private
  def has_access user, friend_id
    return true
    user.friends.any? { |f| f.id == friend_id }
  end
end
