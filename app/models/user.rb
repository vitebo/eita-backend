# frozen_string_literal: true

class User < ApplicationRecord
  has_many :users_tags
  has_many :tags, through: :users_tags

  def calculate_embedding
    tags = self.tags.map(&:name)
    liked_contents = UserContentClassification.where(user_id: self.id, classification: 'like').map(&:content_id)
    disliked_contents = UserContentClassification.where(user_id: self.id, classification: 'dislike').map(&:content_id)

    embedded_tags = EmbeddingCalculator.new.calculate_embedding(tags)
    embedded_liked_contents = liked_contents.map { |content_id| Content.find(content_id).embedding }
    embedded_disliked_contents = disliked_contents.map { |content_id| Content.find(content_id).embedding }
  end
end
