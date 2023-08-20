require 'cosine_similarity'

class ContentRecommendationService
  def initialize(user_id, calculator = EmbeddingCalculator.new)
    @user = User.find(user_id)
    @calculator = calculator
  end

  def recommendations(max_items = 10)
    liked_contents = UserContentClassification.where(user_id: @user.id, classification: UserContentClassification::CLASSIFICATION_VALUES[:like]).map(&:content_id)
    disliked_contents = UserContentClassification.where(user_id: @user.id, classification: UserContentClassification::CLASSIFICATION_VALUES[:dislike]).map(&:content_id)

    user_embedding = @user.embedding

    embedded_liked_contents = @calculator.calculate_embedding(liked_contents.map { |content_id| Content.find(content_id).title })
    embedded_disliked_contents = @calculator.calculate_embedding(disliked_contents.map { |content_id| Content.find(content_id).title })

    recommendations_from_tags = recommendations_from_embeddings(user_embedding, max_items)
    recommendations_from_liked_contents = recommendations_from_embeddings(embedded_liked_contents, max_items)
    recommendations_from_disliked_contents = recommendations_from_embeddings(embedded_disliked_contents, max_items)

    (recommendations_from_tags + recommendations_from_liked_contents - recommendations_from_disliked_contents).reject do |content|
      liked_contents.include?(content[:id]) || disliked_contents.include?(content[:id])
    end
  end

  private

  def recommendations_from_embeddings(embeddings, max_items)
    return [] if embeddings.empty?
    embeddings = JSON.parse(embeddings) if embeddings.is_a?(String)

    contents = Content.where.not(embedding: nil).map do |content|
      {
        id: content.id,
        title: content.title,
        body: content.body,
        slug: content.slug,
        kind: content.kind,
        image: content.image_url,
        score: cosine_similarity(embeddings, JSON.parse(content.embedding))
      }
    end.sort_by { |content| content[:score] }

    contents.reverse.first(max_items)
  end
end
