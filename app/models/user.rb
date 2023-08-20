# frozen_string_literal: true

class User < ApplicationRecord
  has_many :users_tags
  has_many :tags, through: :users_tags

  def calculate_embedding
    tags = self.tags.map(&:name)

    EmbeddingCalculator.new.calculate_embedding(tags)
  end
end
