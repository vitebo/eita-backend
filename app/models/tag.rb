# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :users_tags
  has_many :users, through: :users_tags

  def calculate_embedding
    EmbeddingCalculator.new.calculate_embedding(self.name)
  end
end
