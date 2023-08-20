class UserController < ApplicationController
  def create
    user = User.create!(name: 'mock')
    interests = params[:interests]

    # check if interests is an array with strings
    unless interests.is_a?(Array) && interests.all? { |i| i.is_a?(String) } do
      # respond erros to front with bad request
      render json: { error: 'Interests must be an array of strings' }, status: :bad_request
    end

    interests.each do |interest|
      # find or create tag
      tag = Tag.find_or_create_by(name: interest)
      user.tags << tag
    end

    embedding = user.calculate_embedding
    user.update(embedding: embedding)

    render json: {
      id: user_id,
    }.to_json
  end
end
