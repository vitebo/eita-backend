# frozen_string_literal: true

class UserContentClassification < ApplicationRecord
  belongs_to :user
  belongs_to :content
end
