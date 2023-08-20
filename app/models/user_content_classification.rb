# frozen_string_literal: true

class UserContentClassification < ApplicationRecord
  belongs_to :user
  belongs_to :content

  CLASSIFICATION_VALUES = {
    like: 'like',
    dislike: 'dislike'
  }.freeze
end
