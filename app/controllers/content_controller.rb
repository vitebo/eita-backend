class ContentController < ApplicationController
  def classify(classification)
    user_id = params[:user_id]
    content_id = params[:content_id]
    classification = params[:classification]

    user_content_classification = UserContentClassification.find_or_create_by!(user_id: user_id, content_id: content_id)
    user_content_classification.update!(classification: classification)

    render json: {}.to_json
  end
end
