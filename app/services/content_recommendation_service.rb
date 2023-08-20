require 'cosine_similarity'

class ContentRecommendationService
  def initialize(user_id)
    @user = User.find(user_id)
  end

  def recommendations(max_items = 10)
    user_embedding = @user.embeddings
    contents = Content.where.not(embedding: nil).map do |content|
      {
        id: content.id,
        title: content.title,
        body: content.body,
        score: cosine_similarity(user_embedding, content.embedding)
      }
    end

    contents.sort_by { |content| content[:score] }.reverse.first(max_items)
  end
end
