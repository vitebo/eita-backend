class FeedController < ApplicationController
  def index
    user_id = params[:user_id]
    contents = ContentRecommendationService.new(user_id).recommendations

    render json: { contents: contents }.to_json
  end
end
