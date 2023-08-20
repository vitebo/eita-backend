# frozen_string_literal: true

class User < ApplicationRecord
  has_many :users_tags
  has_many :tags, through: :users_tags

  def calculate_embedding(calculator = EmbeddingCalculator.new)
    tags = self.tags.map(&:name)

    calculator.calculate_embedding(tags)
  end
end
