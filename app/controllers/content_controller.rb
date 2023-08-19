class ContentController < ApplicationController
  def like
    user_id = params[:user_id]
    content_id = params[:content_id]
    weight = params[:weight]

    render json: {}.to_json
  end

  def deslike
    user_id = params[:user_id]
    content_id = params[:content_id]
    weight = params[:weight]

    render json: {}.to_json
  end
end
