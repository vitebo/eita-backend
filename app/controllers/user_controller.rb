class UserController < ApplicationController
  def create
    interests = params[:interests]

    # check if interests is an array with strings
    if interests.is_a?(Array) && interests.all? { |i| i.is_a?(String) } do
      # respond erros to front with bad request
      render json: { error: 'Interests must be an array of strings' }, status: :bad_request
    end

    render json: {
      id: '1234567890',
    }.to_json
  end
end
