require 'cosine_similarity'

class ContentRecommendationService
  def initialize(user_id)
    @user = User.find(user_id)
  end

  def recommendations(max_items = 10)
    liked_contents = UserContentClassification.where(user_id: self.id, classification: 'like').map(&:content_id)
    disliked_contents = UserContentClassification.where(user_id: self.id, classification: 'dislike').map(&:content_id)

    user_embedding = @user.embeddings
    embedded_liked_contents = liked_contents.map { |content_id| Content.find(content_id).embedding }
    embedded_disliked_contents = disliked_contents.map { |content_id| Content.find(content_id).embedding }

    recommendations_from_tags = recommendations_from_embeddings(user_embedding, max_items)
    recommendations_from_liked_contents = recommendations_from_embeddings(embedded_liked_contents, max_items)
    recommendations_from_disliked_contents = recommendations_from_embeddings(embedded_disliked_contents, max_items)

    recommendations_from_tags + recommendations_from_liked_contents - recommendations_from_disliked_contents
  end

  private

  def recommendations_from_embeddings(embeddings, max_items)
    Content.where.not(embedding: nil).map do |content|
      {
        id: content.id,
        title: content.title,
        body: content.body,
        score: cosine_similarity(embeddings, content.embedding)
      }
    end.sort_by { |content| content[:score] }.reverse.first(max_items)
  end
end
