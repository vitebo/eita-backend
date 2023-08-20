class RecalculateUserEmbedding
  def execute
    updated_in_last_30_days = (Time.now - 30.days)..Time.now
    users_content_classification_updated_in_last_30_days = UserContentClassification.where(updated_at: updated_in_last_30_days)
    
    users = users_content_classification_updated_in_last_30_days.map do |user_content_classification|
      user_content_classification.user
    end

    users.uniq.each do |user|
      user = user_content_classification.user
      embedding = user.calculate_embedding
      user.update(embedding: embedding)
    end
  end
end